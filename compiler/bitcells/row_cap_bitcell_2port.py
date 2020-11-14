# See LICENSE for licensing information.
#
# Copyright (c) 2016-2019 Regents of the University of California and The Board
# of Regents for the Oklahoma Agricultural and Mechanical College
# (acting for and on behalf of Oklahoma State University)
# All rights reserved.
#
import debug
from tech import cell_properties as props
import bitcell_base


class row_cap_bitcell_2port(bitcell_base.bitcell_base):
    """
    Row end cap cell. 
    """

    def __init__(self, name="row_cap_cell_1rw_1r"):
        bitcell_base.bitcell_base.__init__(self, name, prop=props.bitcell_2port)
        debug.info(2, "Create row_cap bitcell 1rw+1r object")

        self.no_instances = True
