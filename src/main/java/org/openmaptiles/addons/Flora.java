package org.openmaptiles.addons;

import com.onthegomap.planetiler.FeatureCollector;
import com.onthegomap.planetiler.reader.SourceFeature;
import org.openmaptiles.Layer;
import org.openmaptiles.OpenMapTilesProfile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Flora implements Layer, OpenMapTilesProfile.OsmAllProcessor {
  private static final String LAYER_NAME = "flora";
  private static final Logger LOGGER = LoggerFactory.getLogger(Flora.class);

  @Override
  public String name() {
    return LAYER_NAME;
  }

  @Override
  public void processAllOsm(SourceFeature source, FeatureCollector features) {
    if (source.isPoint() && source.hasTag("flora")) {
      features.point(LAYER_NAME)
        .setBufferPixels(4)
        .setMinZoom(14)
        .setAttr("class", source.getTag("flora"));
    }
  }
}
