# Fembed Uploader Script

This is a Bash script to upload a video to Fembed using their API. The script uses Tus Resumable upload protocol, version 1.0.0 to upload the video. 

## Installation

1. Install `tusd` server by following the instructions [here](https://github.com/tus/tusd#installation).
2. Clone this repository to your local machine.
3. Install the required packages by running `sudo apt-get install curl jq` in the terminal.

## Usage

1. Navigate to the directory containing the script.
2. Run the script with the following command: `./fembedupload.sh video.mp4`.

## Note

1. The script assumes that you have a Fembed account and have obtained a client ID and client secret. If you don't have these, please visit [Fembed](https://www.fembed.com/) to create an account and obtain the required credentials.
2. The video may take some time to be processed by Fembed before it is available for playback.
3. The script has been tested on Ubuntu 18.04 and 20.04.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
