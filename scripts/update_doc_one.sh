R --no-save <<END
source("src/update_doc.r")
update_package_doc(".", "$1")
END
