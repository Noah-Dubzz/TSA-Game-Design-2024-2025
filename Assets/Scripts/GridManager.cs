using UnityEngine;

public class GridManager : MonoBehaviour
{
    [Header("Grid Settings")]
    public GameObject tilePrefab; 
    public int gridWidth = 10;     
    public int gridLength = 10;    
    public float tileSize = 5.0f;  

    void Start()
    {
        GenerateGrid();
    }

    void GenerateGrid()
    {
        if (tilePrefab == null)
        {
            Debug.LogError("Tile Prefab is not assigned!");
            return;
        }

        for (int x = 0; x < gridWidth; x++)
        {
            for (int z = 0; z < gridLength; z++)
            {
              
                Vector3 tilePosition = new Vector3(x * tileSize, 0, z * tileSize);

                
                GameObject tile = Instantiate(tilePrefab, tilePosition, Quaternion.identity);

               
                tile.transform.parent = transform;

                
                tile.name = $"Tile_{x}_{z}";
            }
        }
    }
}
