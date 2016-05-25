# (C) Copyright 2016
# Urs Fässler, bbv Software Services, http://bbv.ch
#
# SPDX-License-Identifier:	GPL-3.0+

Feature: Set brightness depending on the current ambient light
  As a user
  I want to be able to have an adequate brightness
  In order to see the screen in the night and in direct sunlight

Scenario Outline: Set the brightness depending on the ambient light
  Given I start dummy-brightnessd
  And I have a directory "device"
  And I have a file "device/in_illuminance_input" with the content "<lux>"

  When I run ambientlightd with the device "device"

  Then I expect the property "percentage" of brightnessd to be <brightness>

  Examples:
    | lux    | brightness |
    |  25000 |        100 |
    |      1 |         10 |
    | 100000 |        100 |
    |  10000 |         46 |
    |   1000 |         14 |
    |      0 |         10 |

Scenario Outline: Use the conversion parameter from the configuration file
  Given I write "minLux=<min lux>" to the ambientlightd configuration file
  And I write "maxLux=<max lux>" to the ambientlightd configuration file
  And I write "minBrightness=<min brigthness>" to the ambientlightd configuration file
  And I write "maxBrightness=<max brigthness>" to the ambientlightd configuration file
  And I start dummy-brightnessd
  And I have a directory "device"
  And I have a file "device/in_illuminance_input" with the content "<lux>"

  When I run ambientlightd with the device "device"

  Then I expect the property "percentage" of brightnessd to be <brightness>

  Examples:
    | min lux | max lux | min brigthness | max brigthness | lux    | brightness |
    |      10 |   10010 |             20 |             80 |      0 |         20 |
    |       1 |   25000 |             10 |            100 |  10000 |         46 |
    |      10 |   10010 |             20 |             80 |   5010 |         50 |
    |      10 |   10010 |             20 |             80 |  20000 |         80 |
    |       1 |   25000 |             90 |             10 |  10000 |         58 |
