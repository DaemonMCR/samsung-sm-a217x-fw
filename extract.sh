#!/bin/bash

ap_file=$(ls *AP*)
bl_file=$(ls *BL*)

# AP
tar --delete -vf $ap_file \
    boot.img.lz4 dtbo.img.lz4 recovery.img.lz4 super.img.lz4 userdata.img.lz4 vbmeta.img.lz4 vbmeta_samsung.img.lz4 metadata.img.lz4 meta-data

md5sum $ap_file | \
    sed "s/  .*\//  /;s/\.md5$//" >> $ap_file

# BL
tar --delete -vf $bl_file \
    vbmeta.img.lz4

md5sum $bl_file | \
    sed "s/  .*\//  /;s/\.md5$//" >> $bl_file
