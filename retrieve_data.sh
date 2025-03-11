#!bin/bash

VERSION="$(yq eval '.version' params.yml)"
SIZE=$(yq eval ".size.\"${VERSION}\"" params.yml)

URL_LINK="https://jsonplaceholder.typicode.com/photos"

DATA_LOCATION="datahub/data.json"
temp="temp.json"

curl -s "${URL_LINK}" | jq ".[:$SIZE]" > $temp

if [[ ! -f $DATA_LOCATION ]]
  then
  touch ${DATA_LOCATION}
fi

if ! cmp -s ${DATA_LOCATION} $temp
  then

    mv $temp $DATA_LOCATION
  else

    echo "No changes; data has not changed"

    rm $temp

    exit
fi


cat <<-EOF

The current data version is: $VERSION

The total dataset size: $(jq '. | length' $DATA_LOCATION)

Sample rows: $(jq '.[:3]' $DATA_LOCATION)
EOF
