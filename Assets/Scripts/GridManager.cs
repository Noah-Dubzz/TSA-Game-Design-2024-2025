using UnityEngine;
using System.Collections.Generic;

public class GridManager : MonoBehaviour
{
    [Header("Grid Settings")]
    public GameObject tilePrefab;
    public int gridWidth = 10;
    public int gridLength = 10;
    public float tileSize = 1.0f;

    [Header("Player Settings")]
    public int regionSize = 3; // The size of the player’s region

    [Header("Obstacle Settings")]
    public GameObject obstaclePrefab;
    [Range(0, 100)] public int obstaclePercentage = 10;

    private HashSet<Vector2Int> playerRegions = new HashSet<Vector2Int>();
    private bool isChessboardActive = true;

    void Start()
    {
        GenerateGrid();
        AssignPlayerRegions();
        PlaceObstacles();
    }

    void GenerateGrid()
    {
        if (tilePrefab == null)
        {
            Debug.LogError("Tile Prefab is not assigned!");
            return;
        }

        float xOffset = (gridWidth - 1) * tileSize / 2;
        float zOffset = (gridLength - 1) * tileSize / 2;

        for (int x = 0; x < gridWidth; x++)
        {
            for (int z = 0; z < gridLength; z++)
            {
                float xPosition = (x * tileSize) - xOffset;
                float zPosition = (z * tileSize) - zOffset;

                Vector3 tilePosition = new Vector3(xPosition, 0, zPosition);

                GameObject tile = Instantiate(tilePrefab, tilePosition, Quaternion.identity);
                tile.transform.parent = transform;
                tile.name = $"Tile_{x}_{z}";

                if (isChessboardActive)
                {
                    ApplyChessboardPattern(tile, x, z);
                }
                else
                {
                    tile.GetComponent<Renderer>().material.color = Color.white;
                }
            }
        }
    }

    void ApplyChessboardPattern(GameObject tile, int x, int z)
    {
        if ((x + z) % 2 == 0)
        {
            tile.GetComponent<Renderer>().material.color = Color.black;
        }
        else
        {
            tile.GetComponent<Renderer>().material.color = Color.white;
        }
    }

    void AssignPlayerRegions()
    {
        int numberOfPlayers = GameManager.Instance.TotalPlayers;

        if (numberOfPlayers < 2 || numberOfPlayers > 4)
        {
            Debug.LogError("Number of players must be between 2 and 4.");
            return;
        }

        int centerX = gridWidth / 2;
        int centerZ = gridLength / 2;

        Vector2Int[] playerStarts = GetPlayerStartPositions(centerX, centerZ);
        Color[] playerColors = GetPlayerColors(numberOfPlayers);

        for (int i = 0; i < numberOfPlayers; i++)
        {
            Vector2Int start = playerStarts[i];
            Debug.Log($"Player {i + 1} region starts at: {start}");

            HighlightRegion(start.x, start.y, playerColors[i]);
            MarkRegionTiles(start.x, start.y);
        }
    }
    void MarkRegionTiles(int startX, int startZ)
    {
        int halfRegion = regionSize / 2;

        for (int x = -halfRegion; x <= halfRegion; x++)
        {
            for (int z = -halfRegion; z <= halfRegion; z++)
            {
                int tileX = startX + x;
                int tileZ = startZ + z;

                if (tileX >= 0 && tileX < gridWidth && tileZ >= 0 && tileZ < gridLength)
                {
                    playerRegions.Add(new Vector2Int(tileX, tileZ));
                }
            }
        }
    }

    Vector2Int[] GetPlayerStartPositions(int centerX, int centerZ)
    {
        Vector2Int[] positions = new Vector2Int[GameManager.Instance.TotalPlayers];

        if (GameManager.Instance.TotalPlayers == 2)
        {
            positions[0] = new Vector2Int(centerX, 0);
            positions[1] = new Vector2Int(centerX, gridLength - 1);
        }
        else if (GameManager.Instance.TotalPlayers == 3)
        {
            positions[0] = new Vector2Int(centerX, 0);
            positions[1] = new Vector2Int(gridWidth - 1, centerZ);
            positions[2] = new Vector2Int(0, centerZ); // Left-center
        }
        else if (GameManager.Instance.TotalPlayers == 4)
        {
            positions[0] = new Vector2Int(centerX, 0);
            positions[1] = new Vector2Int(gridWidth - 1, centerZ);
            positions[2] = new Vector2Int(centerX, gridLength - 1);
            positions[3] = new Vector2Int(0, centerZ);
        }

        return positions;
    }

    Color[] GetPlayerColors(int numberOfPlayers)
    {
        if (numberOfPlayers == 3)
        {
            return new Color[] { Color.blue, Color.red, Color.green }; // Green replaces Yellow for 3 players
        }
        else
        {
            return new Color[] { Color.blue, Color.red, Color.yellow, Color.green }; // Normal order for 4 players
        }
    }

    void HighlightRegion(int startX, int startZ, Color regionColor)
    {
        int halfRegion = regionSize / 2;

        for (int x = -halfRegion; x <= halfRegion; x++)
        {
            for (int z = -halfRegion; z <= halfRegion; z++)
            {
                int tileX = startX + x;
                int tileZ = startZ + z;

                if (tileX >= 0 && tileX < gridWidth && tileZ >= 0 && tileZ < gridLength)
                {
                    Transform tile = transform.Find($"Tile_{tileX}_{tileZ}");
                    if (tile != null)
                    {
                        tile.GetComponent<Renderer>().material.color = regionColor;
                    }
                    playerRegions.Add(new Vector2Int(tileX, tileZ));
                }
            }
        }
    }

    void PlaceObstacles()
    {
        if (obstaclePrefab == null)
        {
            Debug.LogError("Obstacle Prefab is not assigned!");
            return;
        }

        int totalTiles = gridWidth * gridLength;
        int obstacleCount = totalTiles * obstaclePercentage / 100;

        List<Vector2Int> availableTiles = new List<Vector2Int>();

        for (int x = 0; x < gridWidth; x++)
        {
            for (int z = 0; z < gridLength; z++)
            {
                Vector2Int tilePosition = new Vector2Int(x, z);
                if (!playerRegions.Contains(tilePosition))
                {
                    availableTiles.Add(tilePosition);
                }
            }
        }

        for (int i = 0; i < availableTiles.Count; i++)
        {
            int randomIndex = Random.Range(0, availableTiles.Count);
            Vector2Int temp = availableTiles[i];
            availableTiles[i] = availableTiles[randomIndex];
            availableTiles[randomIndex] = temp;
        }

        for (int i = 0; i < obstacleCount && i < availableTiles.Count; i++)
        {
            Vector2Int position = availableTiles[i];
            Transform tile = transform.Find($"Tile_{position.x}_{position.y}");
            if (tile != null)
            {
                Vector3 spawnPosition = tile.position + Vector3.up * 0.5f;
                Instantiate(obstaclePrefab, spawnPosition, Quaternion.identity, transform);
            }
        }
    }

    public void ToggleChessboard()
    {
        isChessboardActive = !isChessboardActive;

        foreach (Transform child in transform)
        {
            Destroy(child.gameObject);
        }
        GenerateGrid();
        AssignPlayerRegions();
        PlaceObstacles();
    }
}
