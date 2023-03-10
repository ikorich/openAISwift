#!/bin/sh

#  ci_post_xcodebuild.sh
#  openAISwift
#
#  Created by vitalii on 10.03.2023.
#  Copyright © 2023 IGR Soft. All rights reserved.

#!/bin/sh
set -e
if [[ -n $CI_ARCHIVE_PATH ]];
then
    echo "Start Post Script"

    if [ $CI_PRODUCT_PLATFORM = 'iOS' ] then
        echo "iOS pipeline"
        ./ci_upload_to_firebase.sh
    else if [ $CI_PRODUCT_PLATFORM = 'macOS' ]  then
        echo "macOS pipeline"
    else if [ $CI_PRODUCT_PLATFORM = 'tvOS' ]  then
        echo "tvOS pipeline"
    fi

fi
