class EstimoteController < UIViewController
  
  ESTIMOTE_PROXIMITY_UUID = NSUUID.alloc.initWithUUIDString("B9407F30-F5F8-466E-AFF9-25556B57FE6D")
  
  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor
    
    @beaconManager = ESTBeaconManager.alloc.init
    @beaconManager.delegate = self
    
    # Creates sample region object (you can additionaly pass major / minor values).
    #
    # We specify it using only the ESTIMOTE_PROXIMITY_UUID because we want to discover all
    # hardware beacons with Estimote's proximty UUID.
    @region = ESTBeaconRegion.alloc.initWithProximityUUID(ESTIMOTE_PROXIMITY_UUID, identifier: "EstimoteSampleRegion")
    
    # Starts looking for Estimote beacons.
    # All callbacks will be delivered to beaconManager delegate.
    @beaconManager.startRangingBeaconsInRegion(@region)
  end
  
  def viewDidDisappear(animated)
    @beaconManager.stopRangingBeaconsInRegion(@region)
  end

  # Delegate method invoked during ranging. Allows to retrieve NSArray of all discoverd beacons
  # represented with ESTBeacon objects.
  def beaconManager(manager, didRangeBeacons: beacons, inRegion: region)
  end
end
