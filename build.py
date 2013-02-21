#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Adobe Flex Build system - connect to flex remote compile shell and run build

from rook.de import flex
import time
import os
import shutil

sdk = flex.SDK('4.6.0 build 23201')

sdk.swc('robotlegs2-starling-viewmap-2.0.0b5', 
        output='bin/robotlegs2-starling-viewmap-2.0.0b5.swc', 
        external=[l[:-4] for l in os.listdir('libs/') if l.endswith('swc')])
