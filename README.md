# Keyboard Maestro Plugins for OBS Control

This repository provides a set of Keyboard Maestro plugins designed to control various aspects of OBS Studio through the `obs-cmd` CLI. These plugins allow users to automate OBS functions such as recording, streaming, scene switching, and more directly from Keyboard Maestro workflows.

## Plugins Overview

### Start or Stop Recording in OBS
Starts or stops recording in OBS.


  | Parameter      | Options                    | Default | Description                          |
  |----------------|----------------------------|---------|--------------------------------------|
  | Action         | Start, Stop, Toggle        | Toggle  | Specifies whether to start recording, stop recording, or toggle.       |

### Start or stop streaming in OBS
Starts or stops streaming in OBS.


  | Parameter      | Options                    | Default | Description                          |
  |----------------|----------------------------|---------|--------------------------------------|
  | Action         | Start, Stop, Toggle        | Toggle  | Specifies whether to start streaming, stop streaming, or toggle.       |

### Switch Scene in OBS
Switches to a specified scene in OBS.

  | Parameter      | Default                    | Description                          |
  |----------------|----------------------------|--------------------------------------|
  | Scene          | SCENE1                     | Provide the name of the scene as shown in the Scenes palette. This is case sensitive.       |

### Switch Scene Collection in OBS
Switches to a specified scene collection in OBS.

  | Parameter         | Default                    | Description                          |
  |-------------------|----------------------------|--------------------------------------|
  | SceneCollection   | SCENECOLLECTION1           | Provide the name of the Scene Collection that you select in the "Scene Collection" menu. This is case sensitive.         |

### Start or Stop Virtual Camera in OBS
Starts or stops the virtual camera in OBS.

  | Parameter      | Options                    | Default | Description                          |
  |----------------|----------------------------|---------|--------------------------------------|
  | Action         | Start, Stop, Toggle        | Toggle  | Turns off, on, or toggles the Virtual Camera.  |

## Requirements

- macOS
- [Keyboard Maestro](https://www.keyboardmaestro.com/main/)
- [OBS Studio](https://obsproject.com/)
- [obs-cmd](https://github.com/grigio/obs-cmd)

## OBS WebSocket Configuration

Before using these plugins, you need to enable and configure the OBS WebSocket server:

1. Open OBS Studio
2. Go to Tools > WebSocket Server Settings
3. Enable the WebSocket server
4. Configure the following settings:
   - Server Port: 4455 (default)
   - Enable Authentication: Optional (recommended for security)
   - Password: Set a secure password if authentication is enabled
5. Click "Apply" and "OK"

Note: If you enable authentication, you'll need to set the `OBS_WEBSOCKET_PASSWORD` environment variable with your password before using obs-cmd.

## Installation

First you need to install the dependent libraries in order for it to work.
1. Open your Terminal.
2. To install Homebrew, run the following command `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` per instructions from [Homebrew](https://brew.sh/).
3. Download and install obs-cmd:
   - Visit [obs-cmd releases](https://github.com/grigio/obs-cmd/releases)
   - Download the latest release for macOS
   - Extract the binary and place it in a directory in your PATH (e.g., `/usr/local/bin/`)
   - Make the binary executable by running `chmod +x /path/to/obs-cmd`

### Install the plugins in Keyboard Maestro.

Take the ZIP files in the dist/ folder and one and a time drag and drop them into Keyboard Maestro.

You'll then see them show up in the "Third Party Plug Ins" and will be searchable in Keyboard Maestro.

## Usage

Each plugin is designed to be a self-contained action in Keyboard Maestro. Assign macros or hotkeys to trigger these actions based on your production needs.



## Author

- **Ben Vanderberg**

## License

This repository is open-source and provided under the MIT License. See the `LICENSE` file for more details.

## Support

For issues or feature requests, please open an issue in this repository or consult the `Help` sections included in each plugin's metadata.
