// ***************************************************************************
// *   Copyright (C) 2009 Alfonso Ariza Quintana aarizaq@uma.es              *
// *                                                                         *
// *                                                                         *
// *   This program is free software; you can redistribute it and/or modify  *
// *   it under the terms of the GNU General Public License as published by  *
// *   the Free Software Foundation; either version 2 of the License, or     *
// *   (at your option) any later version.                                   *
// *                                                                         *
// *   This program is distributed in the hope that it will be useful,       *
// *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
// *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
// *   GNU General Public License for more details.                          *
// *                                                                         *
// *   You should have received a copy of the GNU General Public License     *
// *   along with this program; if not, write to the                         *
// *   Free Software Foundation, Inc.,                                       *
// *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
// ***************************************************************************

cplusplus {{
#include "ManetAddress.h"
#include "Coord.h"

#define DIRECTLINK 0x40
#define UNIDIRECTIONAL 0x80

#ifdef __USE_MINHOP__
#define BatPacketSize 17 + 27
#else
#define BatPacketSize 16 + 27
#endif

#define BATMAN_HNA_MSG_SIZE 5

}}


class noncobject IPv4Address;
class noncobject ManetAddress;
class noncobject Coord;

struct BatMobileV1_vis_data
{
    uint8_t type;
    uint8_t data;
    ManetAddress ip;
};

struct BatMobileV1_HnaElement
{
    ManetAddress addr;
    uint8_t  netmask;
};

packet BatMobileV1_BatmanPacket
{
    byteLength = BatPacketSize;
    uint8_t        version;  // batman version field
    uint8_t        flags;    // 0x80: UNIDIRECTIONAL link, 0x40: DIRECTLINK flag, ...
    uint8_t        ttl;
    uint8_t        gatewayFlags;  // flags related to gateway functions: gateway class
    unsigned short seqNumber;
    unsigned short gatewayPort;
    ManetAddress        orig;
    ManetAddress        prevSender;
    uint8_t        tq;           // Quality
    uint8_t        hops;
    BatMobileV1_HnaElement   hnaMsg[];    ///< Packet body.
    
    Coord position;
    Coord predictedPosition;
    double score;
}


packet BatMobileV1_visPacket {
    ManetAddress senderIp;
    unsigned char version;
    unsigned char gwClass;
    unsigned char tqMax;
    BatMobileV1_vis_data visData[];
}

