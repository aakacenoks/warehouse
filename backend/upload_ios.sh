url=$1

function generate_plist() {
    echo "Deleting old manifest"
    rm manifest.plist
    echo "Creating new manifest"
    echo "<?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>items</key>
        <array>
            <dict>
                <key>assets</key>
                <array>
                    <dict>
                        <key>kind</key>
                        <string>software-package</string>
                        <key>url</key>
                        <string>${url}</string>
                    </dict>
                </array>
                <key>metadata</key>
                <dict>
                    <key>bundle-identifier</key>
                    <string>BUNDLE_ID</string>
                    <key>bundle-version</key>
                    <string>1.0.0</string>
                    <key>kind</key>
                    <string>software</string>
                    <key>platform-identifier</key>
                    <string>com.apple.platform.iphoneos</string>
                    <key>title</key>
                    <string>Application</string>
                </dict>
            </dict>
        </array>
    </dict>
    </plist>" >> manifest.plist
    echo "Manifest created"    
}

function upload_build_info() {
    full_url="itms-services://?action=download-manifest&amp;url=${url}/manifest.plist"
    echo "Full URL: ${full_url}"    
        curl --location --request POST '192.168.1.65:3001/api/upload' \
            --header 'Content-Type: application/x-www-form-urlencoded' \
            --data-urlencode 'platform=Android' \
            --data-urlencode 'version=v1.0.9' \
            --data-urlencode 'env=test'\
            --data-urlencode "url=${full_url}" \
            --data-urlencode 'name=test.apk'
}

generate_plist
upload_build_info