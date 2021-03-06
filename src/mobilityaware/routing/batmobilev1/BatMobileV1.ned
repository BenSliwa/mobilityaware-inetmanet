//
//   Copyright (C) 2009 by Alfonso Ariza
//   Malaga University
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//


package inet.mobilityaware.routing.batmobilev1;
import inet.mobilityaware.routing.MobilityAwareRoutingBase;


simple BatMobileV1 extends MobilityAwareRoutingBase
{
    parameters:
        @class(BatMobileV1);
        int debugLevel = default(4);
        double purgeTimeout @unit(s) = default(200s);
        double originatorInterval @unit(s) = default(1s);   // originator message interval
        string preferedGateWay = default("0.0.0.0");
        int routingClass = default(0);      // this parameter is used to set the routing behaviour
                                            // *  0: set no default route
                                            // *  1: use fast internet connection (gw_flags * TQ)
                                            // *  2: use stable internet connection (TQ)
                                            // *  3: use fast-switch internet connection (TQ but switch as soon as a better gateway appears)
        bool aggregationEnable = default(true);     // enable/disable multiple batman packet sending/receiving in one UDP packet
        int GWClass_download_speed @unit(kbps) = default(0);    // internet access download speed on preferedGateway, 0 means: this node doesn't have direct internet access
        int GWClass_upload_speed @unit(kbps) = default(0);      // internet access upload speed on preferedGateway, 0 means download speed / 5
        volatile double jitter @unit(s) = default(uniform (0s,0.1s));       // 0..JITTER
        volatile double jitter2 @unit(s) = default(uniform (-0.1s,0.1s));   // -JITTER..+JITTER
        double MAX_AGGREGATION_MS @unit(s) = default(0.1s);                 // MAX_AGGREGATION_MS >= JITTER
        int MAX_AGGREGATION_BYTES @unit(B) = default(512B);
        double desynchronized @unit(s) = default(0s);
        volatile double broadcastDelay @unit("s") = default(uniform(0s,0.005s));  // the delay added to broadcast operations if EqualDelay is set (used to model processing time)
        string announcedNetworks = default("");     // space separated list of announced network/netmask pairs

}

