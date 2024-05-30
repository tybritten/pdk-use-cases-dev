#!/bin/bash
mkdir -p /models
# Define file paths
file1="/models/frcnn_3_xview.pth"
file2="/models/frcnn_4_xview.pth"
file3="/models/frcnn_xview.pth"

# URLs for downloading the files
url1="https://determined-ai-xview-coco-dataset.s3.us-west-2.amazonaws.com/frcnn_3_xview.pth"
url2="https://determined-ai-xview-coco-dataset.s3.us-west-2.amazonaws.com/frcnn_4_xview.pth"
url3="https://determined-ai-xview-coco-dataset.s3.us-west-2.amazonaws.com/frcnn_xview.pth"

# Function to check and download the file if not present, with retry mechanism
check_and_download() {
    local file_path=$1
    local url=$2
    local max_attempts=3
    local attempt=1

    while [ $attempt -le $max_attempts ]; do
            if [ -f "$file_path" ]; then
                echo "File $file_path already exists."
                return 0
            else
                echo "Attempt $attempt: File $file_path does not exist. Downloading..."
                if wget --progress=bar:force:noscroll -T 30 -O "$file_path" "$url"; then
                    echo "Successfully downloaded $file_path."
                    break
                fi
            fi
        echo "Failed to download. Retrying..."
        attempt=$(( $attempt + 1 ))
        done
        }

# Check and download the files
check_and_download $file1 $url1
check_and_download $file2 $url2
check_and_download $file3 $url3
