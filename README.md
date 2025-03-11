# Data Fetch and Update Script

## Project Overview
This project provides an automated Bash script to fetch JSON data from an API and store it in a local file, updating the file only if new data is available. The script is designed to improve efficiency by preventing redundant data updates and ensuring that the latest dataset is maintained.

## Author
**Augustine Emmanuel**

Special thanks to **The Data Immersed Community** for providing the prompt and inspiration for this project.

## Features
- Retrieves data from `https://jsonplaceholder.typicode.com/photos`
- Uses `yq` to extract configuration values from `params.yml`
- Uses `jq` to filter and process JSON data
- Compares the new dataset with the existing one to prevent unnecessary updates
- Displays metadata such as the current data version, dataset size, and a preview of sample rows

## Prerequisites
Ensure the following dependencies are installed on your system:
- `yq` (YAML processor for extracting version and size values)
- `jq` (JSON processor for handling API data)
- `curl` (for making API requests)

## Installation
1. Clone the repository:
   ```sh
   git clone <repository-url>
   cd <repository-name>
   ```
2. Install dependencies:
   ```sh
   sudo apt install jq curl yq -y  # For Debian-based systems
   ```
   *Or use the appropriate package manager for your OS.*

3. Ensure the `params.yml` file exists with the following structure:
   ```yaml
   version: "1.0"
   size:
     "1.0": 10  # Adjust size as needed
   ```

## Usage
Run the script using:
```sh
bash script.sh
```

## How It Works
1. Reads the version from `params.yml`.
2. Extracts the corresponding dataset size for the given version.
3. Fetches the data from the API and limits it based on the extracted size.
4. Compares the new data with the existing file (`datahub/data.json`).
5. Updates the file only if new data is available.
6. Displays:
   - The current data version
   - The total dataset size
   - Sample rows for verification

## Example Output
```
The current data version is: 1.0
The total dataset size: 10
Sample rows: [{"albumId":1,"id":1,"title":"...","url":"...","thumbnailUrl":"..."}, {...}, {...}]
```

## License
This project is released under the MIT License.

## Contributions
Contributions are welcome! Feel free to open an issue or submit a pull request.

## Acknowledgements
- **The Data Immersed Community** for inspiring this project.
- The authors of `jq` and `yq` for their powerful data processing tools.

---
*For any inquiries or improvements, reach out via GitHub or email.*

