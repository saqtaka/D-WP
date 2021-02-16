#!/bin/bash

echo
echo -----------------------------------------
echo execute wp_xx_fudousan.sh
echo -----------------------------------------
source wp_xx_fudousan.sh

echo
echo -----------------------------------------
echo execute wp_x_fudousan.sh
echo -----------------------------------------
source wp_x_fudousan.sh

echo
echo -----------------------------------------
echo execute wp_x_kikan.sh
echo -----------------------------------------
source wp_x_kikan.sh

echo
echo -----------------------------------------
echo execute wp_x_fudousan_display.sh
echo -----------------------------------------
source wp_x_fudousan_display.sh


echo
echo -----------------------------------------
echo execute wp_x_nen.sh
echo -----------------------------------------
source wp_x_nen.sh

echo
echo -----------------------------------------
echo execute wp_x_shikutyouson.sh
echo -----------------------------------------
source wp_x_shikutyouson.sh

echo
echo -----------------------------------------
echo execute wp_x_todoufuken.sh
echo -----------------------------------------
source wp_x_todoufuken.sh