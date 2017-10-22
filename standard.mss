Map {
  background-color: #ffffff;
}


/**** COLORS ****/

/***************************************************************************************/
/* simple railways without service or usage, and those which have no special rendering */
/* sidings without specified usage                                                     */
/* yard tracks without specified usage                                                 */
/* crossover tracks without specified usage                                            */
/***************************************************************************************/
/* TODO make nice */
#railway_line {
  [zoom>=10]["railway"="rail"],
  [zoom>=9]["railway"="narrow_gauge"],
  [zoom>=10]["railway"="light_rail"],
  [zoom>=10]["railway"="subway"],
  [zoom>=11]["railway"="tram"],
  [zoom>=9]["railway"="disused"]["disused_usage"="branch"]["disused_service"=null]["disused_railway"!="light_rail"]["disused_railway"!="subway"]["disused_railway"!="tram"],
  [zoom>=9]["railway"="disused"]["usage"="branch"]["service"=null]["disused_railway"!="light_rail"]["disused_railway"!="subway"]["disused_railway"!="tram"],
  [zoom>=9]["railway"="disused"]["disused_usage"="main"]["disused_service"=null]["disused_railway"!="light_rail"]["disused_railway"!="subway"]["disused_railway"!="tram"],
  [zoom>=9]["railway"="disused"]["usage"="main"]["service"=null]["disused_railway"!="light_rail"]["disused_railway"!="subway"]["disused_railway"!="tram"],
  [zoom>=10]["railway"="disused"]["disused_railway"!="tram"],
  [zoom>=11]["railway"="disused"]["disused_railway"="tram"],
  [zoom>=9]["railway"="abandoned"]["abandoned_usage"="branch"]["abandoned_service"=null]["abandoned_railway"!="light_rail"]["abandoned_railway"!="subway"]["abandoned_railway"!="tram"],
  [zoom>=9]["railway"="abandoned"]["usage"="branch"]["service"=null]["abandoned_railway"!="light_rail"]["abandoned_railway"!="subway"]["abandoned_railway"!="tram"],
  [zoom>=9]["railway"="abandoned"]["abandoned_usage"="main"]["abandoned_service"=null]["abandoned_railway"!="light_rail"]["abandoned_railway"!="subway"]["abandoned_railway"!="tram"],
  [zoom>=9]["railway"="abandoned"]["usage"="main"]["service"=null]["abandoned_railway"!="light_rail"]["abandoned_railway"!="subway"]["abandoned_railway"!="tram"],
  [zoom>=10]["railway"="abandoned"]["abandoned_railway"!="tram"],
  [zoom>=11]["railway"="abandoned"]["abandoned_railway"="tram"],
  [zoom>=9]["railway"="preserved"]["preserved_usage"="branch"]["preserved_service"=null]["preserved_railway"!="light_rail"]["preserved_railway"!="subway"]["preserved_railway"!="tram"],
  [zoom>=9]["railway"="preserved"]["usage"="branch"]["service"=null]["preserved_railway"!="light_rail"]["preserved_railway"!="subway"]["preserved_railway"!="tram"],
  [zoom>=9]["railway"="preserved"]["preserved_usage"="main"]["preserved_service"=null]["preserved_railway"!="light_rail"]["preserved_railway"!="subway"]["preserved_railway"!="tram"],
  [zoom>=9]["railway"="preserved"]["usage"="main"]["service"=null]["preserved_railway"!="light_rail"]["preserved_railway"!="subway"]["preserved_railway"!="tram"],
  [zoom>=10]["railway"="preserved"]["preserved_railway"!="tram"],
  [zoom>=11]["railway"="preserved"]["preserved_railway"="tram"],
  [zoom>=9]["railway"="razed"]["razed_usage"="branch"]["razed_service"=null]["razed_railway"!="light_rail"]["razed_railway"!="subway"]["razed_railway"!="tram"],
  [zoom>=9]["railway"="razed"]["usage"="branch"]["service"=null]["razed_railway"!="light_rail"]["razed_railway"!="subway"]["razed_railway"!="tram"],
  [zoom>=9]["railway"="razed"]["razed_usage"="main"]["razed_service"=null]["razed_railway"!="light_rail"]["razed_railway"!="subway"]["razed_railway"!="tram"],
  [zoom>=9]["railway"="razed"]["usage"="main"]["service"=null]["razed_railway"!="light_rail"]["razed_railway"!="subway"]["razed_railway"!="tram"],
  [zoom>=10]["railway"="razed"]["razed_railway"!="tram"],
  [zoom>=11]["railway"="razed"]["razed_railway"="tram"],
  [zoom>=9]["railway"="proposed"]["proposed_usage"="branch"]["proposed_service"=null]["proposed"=null]["proposed_railway"!="light_rail"]["proposed_railway"!="subway"]["proposed_railway"!="tram"]["proposed_railway"!="platform"],
  [zoom>=9]["railway"="proposed"]["usage"="branch"]["service"=null]["proposed"=null]["proposed_railway"!="light_rail"]["proposed_railway"!="subway"]["proposed_railway"!="tram"]["proposed_railway"!="platform"],
  [zoom>=9]["railway"="proposed"]["proposed_usage"="main"]["proposed_service"=null]["proposed_railway"=null]["proposed"!="light_rail"]["proposed"!="subway"]["proposed"!="tram"]["proposed"!="platform"],
  [zoom>=9]["railway"="proposed"]["usage"="main"]["service"=null]["proposed_railway"=null]["proposed"!="light_rail"]["proposed"!="subway"]["proposed"!="tram"]["proposed"!="platform"],
  [zoom>=10]["railway"="proposed"]["proposed_railway"!="tram"],
  [zoom>=10]["railway"="proposed"]["proposed_railway"=null]["proposed"!="tram"],
  [zoom>=11]["railway"="proposed"]["proposed_railway"="tram"],
  [zoom>=11]["railway"="proposed"]["proposed_railway"=null]["proposed"="tram"],
  [zoom>=9]["railway"="construction"]["construction_usage"="branch"]["construction_service"=null]["construction"=null]["construction_railway"!="light_rail"]["construction_railway"!="subway"]["construction_railway"!="tram"]["construction_railway"!="platform"],
  [zoom>=9]["railway"="construction"]["usage"="branch"]["service"=null]["construction"=null]["construction_railway"!="light_rail"]["construction_railway"!="subway"]["construction_railway"!="tram"]["construction_railway"!="platform"],
  [zoom>=9]["railway"="construction"]["construction_usage"="main"]["construction_service"=null]["construction_railway"=null]["construction"!="light_rail"]["construction"!="subway"]["construction"!="tram"]["construction"!="platform"],
  [zoom>=9]["railway"="construction"]["usage"="main"]["service"=null]["construction_railway"=null]["construction"!="light_rail"]["construction"!="subway"]["construction"!="tram"]["construction"!="platform"],
  [zoom>=10]["railway"="construction"]["construction_railway"!="tram"],
  [zoom>=10]["railway"="construction"]["construction_railway"=null]["construction"!="tram"],
  [zoom>=11]["railway"="construction"]["construction_railway"="tram"],
  [zoom>=11]["railway"="construction"]["construction_railway"=null]["construction"="tram"] {
    ["usage"=null]["service"=null],
    ["usage"="tourism"]["service"=null],
    ["usage"="military"]["service"=null],
    ["usage"="test"]["service"=null],
    ["usage"=null]["service"="siding"],
    ["usage"=null]["service"="yard"],
    ["usage"=null]["service"="crossover"] {
      line-color: black;
    }
  
    /***************************************/
    /* spur tracks without specified usage */
    /***************************************/
    ["usage"=null]["service"="spur"] {
      line-color: #87491D;
    }
    
    /*********************************************/
    /* branch railways, service tag not rendered */
    /*********************************************/
    ["railway"="construction"]["construction_railway"="rail"]["usage"="branch"],
    ["railway"="proposed"]["proposed_railway"="rail"]["usage"="branch"],
    ["usage"="branch"]["service"=null] {
      line-color: #DACA00;
    }
    
    /*******************************************/
    /* main railways, service tag not rendered */
    /*******************************************/
    /** shared between railway=proposed and railway=construction **/
    /*  show the color of what the railway will become            */
    ["railway"="construction"]["construction_railway"="rail"]["usage"="main"],
    ["railway"="proposed"]["proposed_railway"="rail"]["usage"="main"],
    ["usage"="main"]["service"=null] {
      line-color: #FF8100;
    }
    
    /************************************************/
    /* highspeed railways, service tag not rendered */
    /************************************************/
    ["railway"="construction"]["construction_railway"="rail"]["usage"="main"]["highspeed"="yes"],
    ["railway"="proposed"]["proposed_railway"="rail"]["usage"="main"]["highspeed"="yes"],
    ["usage"="main"]["highspeed"="yes"]["service"=null] {
      line-color: #FF0C00;
    }
    
    /*************************************************/
    /* industrial railways without service tag       */
    /* industrial railways with various service tags */
    /*************************************************/
    ["usage"="industrial"]["service"=null],
    ["usage"="industrial"]["service"="siding"],
    ["usage"="industrial"]["service"="spur"],
    ["usage"="industrial"]["service"="yard"],
    ["usage"="industrial"]["service"="crossover"] {
      line-color: #87491D;
    }
    
    /*********************/
    /* light rail tracks */
    /*********************/
    ["railway"="light_rail"],
    ["railway"="construction"]["construction_railway"="light_rail"],
    ["railway"="construction"]["construction"="light_rail"],
    ["railway"="proposed"]["proposed_railway"="light_rail"],
    ["railway"="proposed"]["proposed"="light_rail"] {
           line-color: #00BD14;
    }
    
    /*****************/
    /* subway tracks */
    /*****************/
    ["railway"="subway"],
    ["railway"="construction"]["construction_railway"="subway"],
    ["railway"="construction"]["construction"="subway"],
    ["railway"="proposed"]["proposed_railway"="subway"],
    ["railway"="proposed"]["proposed"="subway"] {
           line-color: #0300C3;
    }
    
    /***************/
    /* tram tracks */
    /***************/
    ["railway"="tram"],
    ["railway"="construction"]["construction_railway"="tram"],
    ["railway"="construction"]["construction"="tram"],
    ["railway"="proposed"]["proposed_railway"="tram"],
    ["railway"="proposed"]["proposed"="tram"] {
      line-color: #D877B8;
    }
  }
  
  /***************************************************************************************/
  /* simple railways without service or usage, and those which have no special rendering */
  /***************************************************************************************/
  [zoom>=10]["railway"="rail"]["usage"=null]["service"=null],
  [zoom>=10]["railway"="rail"]["usage"="tourism"]["service"=null],
  [zoom>=10]["railway"="rail"]["usage"="military"]["service"=null],
  [zoom>=10]["railway"="rail"]["usage"="test"]["service"=null] {
    line-width: 2.5;
  }
  
  /***********************************/
  /* sidings without specified usage */
  /***********************************/
  [zoom>=10]["railway"="rail"]["usage"=null]["service"="siding"] {
    line-width: 2;
  }
  
  /***************************************/
  /* yard tracks without specified usage */
  /***************************************/
  [zoom>=10]["railway"="rail"]["usage"=null]["service"="yard"] {
    line-width: 1.5;
  }
  
  /***************************************/
  /* spur tracks without specified usage */
  /***************************************/
  [zoom>=10]["railway"="rail"]["usage"=null]["service"="spur"] {
    line-width: 3;
  /*  text-position: line;*/ /*TODO*/
  }
  
  /********************************************/
  /* crossover tracks without specified usage */
  /********************************************/
  [zoom>=10]["railway"="rail"]["usage"=null]["service"="crossover"] {
    line-width: 1;
  }
  
  /*********************************************/
  /* branch railways, service tag not rendered */
  /*********************************************/
  [zoom>=2]["railway"="rail"]["usage"="branch"]["service"=null] {
    line-width: 1.5;
  }
  /* thicker lines in higher zoom levels */
  [zoom>=6][zoom<=8]["railway"="rail"]["usage"="branch"]["service"=null] {
    line-width: 2.5;
  }
  [zoom>=9]["railway"="rail"]["usage"="branch"]["service"=null] {
    line-width: 3.5;
  }
  
  /*******************************************/
  /* main railways, service tag not rendered */
  /*******************************************/
  [zoom>=2]["railway"="rail"]["usage"="main"]["service"=null] {
    line-width: 1.5;
  }
  /* thicker lines in higher zoom levels */
  [zoom>=6][zoom<=8]["railway"="rail"]["usage"="main"]["service"=null] {
    line-width: 2.5;
  }
  [zoom>=9]["railway"="rail"]["usage"="main"]["service"=null] {
    line-width: 3.5;
  }
  
  /************************************************/
  /* highspeed railways, service tag not rendered */
  /************************************************/
  [zoom>=2]["railway"="rail"]["usage"="main"]["highspeed"="yes"]["service"=null] {
    line-width: 1.5;
  }
  /* thicker lines in higher zoom levels */
  [zoom>=6][zoom<=8]["railway"="rail"]["usage"="main"]["highspeed"="yes"]["service"=null] {
    line-width: 2.5;
  }
  [zoom>=9]["railway"="rail"]["usage"="main"]["highspeed"="yes"]["service"=null] {
    line-width: 3.5;
  }
  
  /*******************************************/
  /* industrial railways without service tag */
  /*******************************************/
  [zoom>=10]["railway"="rail"]["usage"="industrial"]["service"=null] {
    line-width: 2;
  }
  
  /*************************************************/
  /* industrial railways with various service tags */
  /*************************************************/
  [zoom>=10]["railway"="rail"]["usage"="industrial"]["service"="siding"],
  [zoom>=10]["railway"="rail"]["usage"="industrial"]["service"="spur"],
  [zoom>=10]["railway"="rail"]["usage"="industrial"]["service"="yard"],
  [zoom>=10]["railway"="rail"]["usage"="industrial"]["service"="crossover"] {
    line-width: 1.5;
  }
  
  /**********************/
  /* preserved railways */
  /**********************/
  [zoom>=9]["railway"="preserved"] {
    line-color: #70584D;
    line-width: 2;
   /* casing-width: 2; */
   /* casing-color: #70584D; */
   /* casing-dashes: 3,10; */
  }
  
  /*******************************/
  /* railways under construction */
  /*******************************/
  [zoom>=2]["railway"="rail"]["usage"="main"]["service"=null],
  [zoom>=8]["railway"="rail"]["usage"="branch"]["service"=null],
  [zoom>=10]["railway"="rail"],
  [zoom>=9]["railway"="narrow_gauge"],
  [zoom>=10]["railway"="light_rail"],
  [zoom>=10]["railway"="subway"],
  [zoom>=11]["railway"="tram"],
  [zoom>=9]["railway"="disused"]["disused_usage"="branch"]["disused_service"=null]["disused_railway"!="light_rail"]["disused_railway"!="subway"]["disused_railway"!="tram"],
  [zoom>=9]["railway"="disused"]["usage"="branch"]["service"=null]["disused_railway"!="light_rail"]["disused_railway"!="subway"]["disused_railway"!="tram"],
  [zoom>=9]["railway"="disused"]["disused_usage"="main"]["disused_service"=null]["disused_railway"!="light_rail"]["disused_railway"!="subway"]["disused_railway"!="tram"],
  [zoom>=9]["railway"="disused"]["usage"="main"]["service"=null]["disused_railway"!="light_rail"]["disused_railway"!="subway"]["disused_railway"!="tram"],
  [zoom>=10]["railway"="disused"]["disused_railway"!="tram"],
  [zoom>=11]["railway"="disused"]["disused_railway"="tram"],
  [zoom>=9]["railway"="abandoned"]["abandoned_usage"="branch"]["abandoned_service"=null]["abandoned_railway"!="light_rail"]["abandoned_railway"!="subway"]["abandoned_railway"!="tram"],
  [zoom>=9]["railway"="abandoned"]["usage"="branch"]["service"=null]["abandoned_railway"!="light_rail"]["abandoned_railway"!="subway"]["abandoned_railway"!="tram"],
  [zoom>=9]["railway"="abandoned"]["abandoned_usage"="main"]["abandoned_service"=null]["abandoned_railway"!="light_rail"]["abandoned_railway"!="subway"]["abandoned_railway"!="tram"],
  [zoom>=9]["railway"="abandoned"]["usage"="main"]["service"=null]["abandoned_railway"!="light_rail"]["abandoned_railway"!="subway"]["abandoned_railway"!="tram"],
  [zoom>=10]["railway"="abandoned"]["abandoned_railway"!="tram"],
  [zoom>=11]["railway"="abandoned"]["abandoned_railway"="tram"],
  [zoom>=9]["railway"="preserved"]["preserved_usage"="branch"]["preserved_service"=null]["preserved_railway"!="light_rail"]["preserved_railway"!="subway"]["preserved_railway"!="tram"],
  [zoom>=9]["railway"="preserved"]["usage"="branch"]["service"=null]["preserved_railway"!="light_rail"]["preserved_railway"!="subway"]["preserved_railway"!="tram"],
  [zoom>=9]["railway"="preserved"]["preserved_usage"="main"]["preserved_service"=null]["preserved_railway"!="light_rail"]["preserved_railway"!="subway"]["preserved_railway"!="tram"],
  [zoom>=9]["railway"="preserved"]["usage"="main"]["service"=null]["preserved_railway"!="light_rail"]["preserved_railway"!="subway"]["preserved_railway"!="tram"],
  [zoom>=10]["railway"="preserved"]["preserved_railway"!="tram"],
  [zoom>=11]["railway"="preserved"]["preserved_railway"="tram"],
  [zoom>=9]["railway"="razed"]["razed_usage"="branch"]["razed_service"=null]["razed_railway"!="light_rail"]["razed_railway"!="subway"]["razed_railway"!="tram"],
  [zoom>=9]["railway"="razed"]["usage"="branch"]["service"=null]["razed_railway"!="light_rail"]["razed_railway"!="subway"]["razed_railway"!="tram"],
  [zoom>=9]["railway"="razed"]["razed_usage"="main"]["razed_service"=null]["razed_railway"!="light_rail"]["razed_railway"!="subway"]["razed_railway"!="tram"],
  [zoom>=9]["railway"="razed"]["usage"="main"]["service"=null]["razed_railway"!="light_rail"]["razed_railway"!="subway"]["razed_railway"!="tram"],
  [zoom>=10]["railway"="razed"]["razed_railway"!="tram"],
  [zoom>=11]["railway"="razed"]["razed_railway"="tram"],
  [zoom>=9]["railway"="proposed"]["proposed_usage"="branch"]["proposed_service"=null]["proposed"=null]["proposed_railway"!="light_rail"]["proposed_railway"!="subway"]["proposed_railway"!="tram"]["proposed_railway"!="platform"],
  [zoom>=9]["railway"="proposed"]["usage"="branch"]["service"=null]["proposed"=null]["proposed_railway"!="light_rail"]["proposed_railway"!="subway"]["proposed_railway"!="tram"]["proposed_railway"!="platform"],
  [zoom>=9]["railway"="proposed"]["proposed_usage"="main"]["proposed_service"=null]["proposed_railway"=null]["proposed"!="light_rail"]["proposed"!="subway"]["proposed"!="tram"]["proposed"!="platform"],
  [zoom>=9]["railway"="proposed"]["usage"="main"]["service"=null]["proposed_railway"=null]["proposed"!="light_rail"]["proposed"!="subway"]["proposed"!="tram"]["proposed"!="platform"],
  [zoom>=10]["railway"="proposed"]["proposed_railway"!="tram"],
  [zoom>=10]["railway"="proposed"]["proposed_railway"=null]["proposed"!="tram"],
  [zoom>=11]["railway"="proposed"]["proposed_railway"="tram"],
  [zoom>=11]["railway"="proposed"]["proposed_railway"=null]["proposed"="tram"],
  [zoom>=9]["railway"="construction"]["construction_usage"="branch"]["construction_service"=null]["construction"=null]["construction_railway"!="light_rail"]["construction_railway"!="subway"]["construction_railway"!="tram"]["construction_railway"!="platform"],
  [zoom>=9]["railway"="construction"]["usage"="branch"]["service"=null]["construction"=null]["construction_railway"!="light_rail"]["construction_railway"!="subway"]["construction_railway"!="tram"]["construction_railway"!="platform"],
  [zoom>=9]["railway"="construction"]["construction_usage"="main"]["construction_service"=null]["construction_railway"=null]["construction"!="light_rail"]["construction"!="subway"]["construction"!="tram"]["construction"!="platform"],
  [zoom>=9]["railway"="construction"]["usage"="main"]["service"=null]["construction_railway"=null]["construction"!="light_rail"]["construction"!="subway"]["construction"!="tram"]["construction"!="platform"],
  [zoom>=10]["railway"="construction"]["construction_railway"!="tram"],
  [zoom>=10]["railway"="construction"]["construction_railway"=null]["construction"!="tram"],
  [zoom>=11]["railway"="construction"]["construction_railway"="tram"],
  [zoom>=11]["railway"="construction"]["construction_railway"=null]["construction"="tram"] {
    [zoom>=9]["railway"="construction"] {
      line-dasharray: 9,9;
      line-width: 3;
    }
    
    /*********************/
    /* proposed railways */
    /*********************/
    [zoom>=9]["railway"="proposed"] {
      line-dasharray: 2,8;
      line-width: 3;
    }
  }
  
  /********************/
  /* disused railways */
  /********************/
  [zoom>=9]["railway"="disused"] {
    line-color: #70584D;
    line-width: 3;
  }
  
  /**********************/
  /* abandoned railways */
  /**********************/
  [zoom>=9]["railway"="abandoned"] {
    line-dasharray: 5,5;
    line-color: #70584D;
    line-width: 3;
    line-opacity: 0.8;
  }
  
  /******************/
  /* razed railways */
  /******************/
  [zoom>=9]["railway"="razed"] {
    line-dasharray: 3,7;
    line-color: #70584D;
    line-opacity: 0.6;
    line-width: 3;
  }
  
  /*********************/
  /* tram tracks       */
  /* subway tracks     */
  /* light rail tracks */
  /*********************/
  [zoom>=11]["railway"="tram"],
  [zoom>=10]["railway"="subway"],
  [zoom>=10]["railway"="light_rail"] {
    line-width: 2.5;
  }
  
  /*******************************************************************************************/
  /* narrow gauge tracks without service or usage, and those which have no special rendering */
  /*******************************************************************************************/
  [zoom>=9]["railway"="narrow_gauge"]["usage"=null]["service"=null],
  [zoom>=9]["railway"="narrow_gauge"]["usage"="tourism"]["service"=null],
  [zoom>=9]["railway"="narrow_gauge"]["usage"="military"]["service"=null],
  [zoom>=9]["railway"="narrow_gauge"]["usage"="test"]["service"=null] {
    line-width: 1.5;
   /* casing-width: 1.5; */
  }
  
  /************************************************/
  /* narrow gauge sidings without specified usage */
  /************************************************/
  [zoom>=10]["railway"="narrow_gauge"]["usage"=null]["service"="siding"] {
    line-width: 1.5;
   /* casing-width: 1; */
  }
  
  /****************************************************/
  /* narrow gauge yard tracks without specified usage */
  /****************************************************/
  [zoom>=10]["railway"="narrow_gauge"]["usage"=null]["service"="yard"] {
    line-width: 1.5;
   /* casing-width: 1; */
  }
  
  /****************************************************/
  /* narrow gauge spur tracks without specified usage */
  /****************************************************/
  [zoom>=10]["railway"="narrow_gauge"]["usage"=null]["service"="spur"] {
    line-width: 1.5;
   /* casing-width: 1; */
    /* text-position: line; */
  }
  
  /*********************************************************/
  /* narrow gauge crossover tracks without specified usage */
  /*********************************************************/
  [zoom>=10]["railway"="narrow_gauge"]["usage"=null]["service"="crossover"] {
    line-width: 1.5;
   /* casing-width: 1; */
  }
  
  /**********************************************************/
  /* narrow gauge branch railways, service tag not rendered */
  /**********************************************************/
  [zoom>=9]["railway"="narrow_gauge"]["usage"="branch"]["service"=null] {
    line-width: 1.5;
   /* casing-width: 1.5; */
  }
  
  /********************************************************/
  /* narrow gauge main railways, service tag not rendered */
  /********************************************************/
  [zoom>=9]["railway"="narrow_gauge"]["usage"="main"]["service"=null] {
    line-width: 1.5;
   /* casing-width: 1.5; */
  }
  
  /*************************************************************/
  /* narrow gauge highspeed railways, service tag not rendered */
  /*************************************************************/
  [zoom>=9]["railway"="narrow_gauge"]["usage"="main"]["highspeed"="yes"]["service"=null] {
    line-width: 1.5;
   /* casing-width: 1.5; */
  }
  
  /********************************************************/
  /* narrow gauge industrial railways without service tag */
  /********************************************************/
  [zoom>=9]["railway"="narrow_gauge"]["usage"="industrial"]["service"=null] {
    line-width: 1.5;
   /* casing-width: 1.5; */
  }
  
  /**************************************************************/
  /* narrow gauge industrial railways with various service tags */
  /**************************************************************/
  [zoom>=10]["railway"="narrow_gauge"]["usage"="industrial"]["service"="siding"],
  [zoom>=10]["railway"="narrow_gauge"]["usage"="industrial"]["service"="spur"],
  [zoom>=10]["railway"="narrow_gauge"]["usage"="industrial"]["service"="yard"],
  [zoom>=10]["railway"="narrow_gauge"]["usage"="industrial"]["service"="crossover"] {
    line-width: 1.5;
   /* casing-width: 1; */
  }
  
  [zoom>=2]["railway"="rail"]["usage"="main"]["service"=null],
  [zoom>=8]["railway"="rail"]["usage"="branch"]["service"=null],
  [zoom>=10]["railway"="rail"],
  [zoom>=9]["railway"="narrow_gauge"],
  [zoom>=10]["railway"="light_rail"],
  [zoom>=10]["railway"="subway"],
  [zoom>=11]["railway"="tram"],
  [zoom>=9]["railway"="disused"]["disused_usage"="branch"]["disused_service"=null]["disused_railway"!="light_rail"]["disused_railway"!="subway"]["disused_railway"!="tram"],
  [zoom>=9]["railway"="disused"]["usage"="branch"]["service"=null]["disused_railway"!="light_rail"]["disused_railway"!="subway"]["disused_railway"!="tram"],
  [zoom>=9]["railway"="disused"]["disused_usage"="main"]["disused_service"=null]["disused_railway"!="light_rail"]["disused_railway"!="subway"]["disused_railway"!="tram"],
  [zoom>=9]["railway"="disused"]["usage"="main"]["service"=null]["disused_railway"!="light_rail"]["disused_railway"!="subway"]["disused_railway"!="tram"],
  [zoom>=10]["railway"="disused"]["disused_railway"!="tram"],
  [zoom>=11]["railway"="disused"]["disused_railway"="tram"],
  [zoom>=9]["railway"="abandoned"]["abandoned_usage"="branch"]["abandoned_service"=null]["abandoned_railway"!="light_rail"]["abandoned_railway"!="subway"]["abandoned_railway"!="tram"],
  [zoom>=9]["railway"="abandoned"]["usage"="branch"]["service"=null]["abandoned_railway"!="light_rail"]["abandoned_railway"!="subway"]["abandoned_railway"!="tram"],
  [zoom>=9]["railway"="abandoned"]["abandoned_usage"="main"]["abandoned_service"=null]["abandoned_railway"!="light_rail"]["abandoned_railway"!="subway"]["abandoned_railway"!="tram"],
  [zoom>=9]["railway"="abandoned"]["usage"="main"]["service"=null]["abandoned_railway"!="light_rail"]["abandoned_railway"!="subway"]["abandoned_railway"!="tram"],
  [zoom>=10]["railway"="abandoned"]["abandoned_railway"!="tram"],
  [zoom>=11]["railway"="abandoned"]["abandoned_railway"="tram"],
  [zoom>=9]["railway"="preserved"]["preserved_usage"="branch"]["preserved_service"=null]["preserved_railway"!="light_rail"]["preserved_railway"!="subway"]["preserved_railway"!="tram"],
  [zoom>=9]["railway"="preserved"]["usage"="branch"]["service"=null]["preserved_railway"!="light_rail"]["preserved_railway"!="subway"]["preserved_railway"!="tram"],
  [zoom>=9]["railway"="preserved"]["preserved_usage"="main"]["preserved_service"=null]["preserved_railway"!="light_rail"]["preserved_railway"!="subway"]["preserved_railway"!="tram"],
  [zoom>=9]["railway"="preserved"]["usage"="main"]["service"=null]["preserved_railway"!="light_rail"]["preserved_railway"!="subway"]["preserved_railway"!="tram"],
  [zoom>=10]["railway"="preserved"]["preserved_railway"!="tram"],
  [zoom>=11]["railway"="preserved"]["preserved_railway"="tram"],
  [zoom>=9]["railway"="razed"]["razed_usage"="branch"]["razed_service"=null]["razed_railway"!="light_rail"]["razed_railway"!="subway"]["razed_railway"!="tram"],
  [zoom>=9]["railway"="razed"]["usage"="branch"]["service"=null]["razed_railway"!="light_rail"]["razed_railway"!="subway"]["razed_railway"!="tram"],
  [zoom>=9]["railway"="razed"]["razed_usage"="main"]["razed_service"=null]["razed_railway"!="light_rail"]["razed_railway"!="subway"]["razed_railway"!="tram"],
  [zoom>=9]["railway"="razed"]["usage"="main"]["service"=null]["razed_railway"!="light_rail"]["razed_railway"!="subway"]["razed_railway"!="tram"],
  [zoom>=10]["railway"="razed"]["razed_railway"!="tram"],
  [zoom>=11]["railway"="razed"]["razed_railway"="tram"],
  [zoom>=9]["railway"="proposed"]["proposed_usage"="branch"]["proposed_service"=null]["proposed"=null]["proposed_railway"!="light_rail"]["proposed_railway"!="subway"]["proposed_railway"!="tram"]["proposed_railway"!="platform"],
  [zoom>=9]["railway"="proposed"]["usage"="branch"]["service"=null]["proposed"=null]["proposed_railway"!="light_rail"]["proposed_railway"!="subway"]["proposed_railway"!="tram"]["proposed_railway"!="platform"],
  [zoom>=9]["railway"="proposed"]["proposed_usage"="main"]["proposed_service"=null]["proposed_railway"=null]["proposed"!="light_rail"]["proposed"!="subway"]["proposed"!="tram"]["proposed"!="platform"],
  [zoom>=9]["railway"="proposed"]["usage"="main"]["service"=null]["proposed_railway"=null]["proposed"!="light_rail"]["proposed"!="subway"]["proposed"!="tram"]["proposed"!="platform"],
  [zoom>=10]["railway"="proposed"]["proposed_railway"!="tram"],
  [zoom>=10]["railway"="proposed"]["proposed_railway"=null]["proposed"!="tram"],
  [zoom>=11]["railway"="proposed"]["proposed_railway"="tram"],
  [zoom>=11]["railway"="proposed"]["proposed_railway"=null]["proposed"="tram"],
  [zoom>=9]["railway"="construction"]["construction_usage"="branch"]["construction_service"=null]["construction"=null]["construction_railway"!="light_rail"]["construction_railway"!="subway"]["construction_railway"!="tram"]["construction_railway"!="platform"],
  [zoom>=9]["railway"="construction"]["usage"="branch"]["service"=null]["construction"=null]["construction_railway"!="light_rail"]["construction_railway"!="subway"]["construction_railway"!="tram"]["construction_railway"!="platform"],
  [zoom>=9]["railway"="construction"]["construction_usage"="main"]["construction_service"=null]["construction_railway"=null]["construction"!="light_rail"]["construction"!="subway"]["construction"!="tram"]["construction"!="platform"],
  [zoom>=9]["railway"="construction"]["usage"="main"]["service"=null]["construction_railway"=null]["construction"!="light_rail"]["construction"!="subway"]["construction"!="tram"]["construction"!="platform"],
  [zoom>=10]["railway"="construction"]["construction_railway"!="tram"],
  [zoom>=10]["railway"="construction"]["construction_railway"=null]["construction"!="tram"],
  [zoom>=11]["railway"="construction"]["construction_railway"="tram"],
  [zoom>=11]["railway"="construction"]["construction_railway"=null]["construction"="tram"] {
    /* must stay last: apply the color of the line also to the casing */
    ["railway"="narrow_gauge"] {
      /* casing-color: eval(prop("color")); */
      /* casing-dashes: 3,3; */
    }
  }
}
