using UnityEngine;

public class GridManager : MonoBehaviour
{
    [Header("Grid Settings")]
    public GameObject tilePrefab;    // Prefab for the tile
    public int gridWidth = 10;       // Number of tiles along the width (x-axis)
    public int gridLength = 10;      // Number of tiles along the length (z-axis)
    public float tileSize = 1.0f;    // Size of each tile

    [Header("Player Settings")]
    public int numberOfPlayers = 2; // Number of players (2 to 4)
    public int regionSize = 3;      // Size of the player region (3x3)

    private Color[] playerColors = new Color[] { Color.blue, Color.red, Color.green, Color.yellow };

    void Start()
    {
        GenerateGrid();
        AssignPlayerRegions();
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
            }
        }
    }

    void AssignPlayerRegions()
    {
        if (numberOfPlayers < 2 || numberOfPlayers > 4)
        {
            Debug.LogError("Number of players must be between 2 and 4.");
            return;
        }

        // Calculate grid center
        int centerX = gridWidth / 2;
        int centerZ = gridLength / 2;

        // Define regions for players
        Vector2Int[] playerStarts = GetPlayerStartPositions(centerX, centerZ);

        for (int i = 0; i < numberOfPlayers; i++)
        {
            Vector2Int start = playerStarts[i];
            Debug.Log($"Player {i + 1} region starts at: {start}");

            // Highlight the player's region with their color
            HighlightRegion(start.x, start.y, playerColors[i]);
        }
    }

    Vector2Int[] GetPlayerStartPositions(int centerX, int centerZ)
    {
        // Positions based on the number of players
        Vector2Int[] positions = new Vector2Int[numberOfPlayers];

        if (numberOfPlayers == 2)
        {
            positions[0] = new Vector2Int(centerX, 0);                // Bottom-center
            positions[1] = new Vector2Int(centerX, gridLength - 1);   // Top-center
        }
        else if (numberOfPlayers == 3)
        {
            positions[0] = new Vector2Int(centerX, 0);                // Bottom-center
            positions[1] = new Vector2Int(gridWidth - 1, centerZ);    // Right-center
            positions[2] = new Vector2Int(0, centerZ);                // Left-center
        }
        else if (numberOfPlayers == 4)
        {
            positions[0] = new Vector2Int(centerX, 0);                // Bottom-center
            positions[1] = new Vector2Int(centerX, gridLength - 1);   // Top-center
            positions[2] = new Vector2Int(gridWidth - 1, centerZ);    // Right-center
            positions[3] = new Vector2Int(0, centerZ);                // Left-center
        }

        return positions;
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

                // Check bounds
                if (tileX >= 0 && tileX < gridWidth && tileZ >= 0 && tileZ < gridLength)
                {
                    Transform tile = transform.Find($"Tile_{tileX}_{tileZ}");
                    if (tile != null)
                    {
                        tile.GetComponent<Renderer>().material.color = regionColor; // Highlight with player's color
                    }
                }
            }
        }
    }
}
