#!/bin/bash
export IFS=$'\n'
#!/bin/bash
export IFS=$'\n'
DIR=$(cd $(dirname $0); pwd)
cd $DIR

DATE=`date +%Y_%m_%d`
argv=("$@")
CMDNAME=`basename $0`

if [ $# -eq 0 ]; then
	    echo "Usage : ${CMDNAME} [dirname]"
	        exit 1
fi

for TARGET_DIR in ${argv}
do

	for FILENAME in `find "${TARGET_DIR}/" -name "*.rar"`
	do
	        folder=${FILENAME%%.rar}
	        mkdir "${folder}" || continue
	        unrar x "${FILENAME}" "${folder}" || continue
	        zip -r "${folder}.zip" "${folder}" || continue
	        rm -Rf "${folder}"
	        rm -f "${FILENAME}"
	done
done
