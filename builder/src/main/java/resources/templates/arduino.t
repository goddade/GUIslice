<ALIGN>
  gslc_ElemSetTxtAlign(&m_gui,pElemRef,$<TEXT_ALIGN>);
<STOP>
<BACKGROUND>
  
  // Background flat color
  gslc_SetBkgndColor(&m_gui,$<BACKGROUND_COLOR>);
<STOP>
<BOX>
   
  // Create $<WIDGET_ENUM> box
  pElemRef = gslc_ElemCreateBox(&m_gui,$<WIDGET_ENUM>,$<PAGE_ENUM>,(gslc_tsRect){$<X>,$<Y>,$<WIDTH>,$<HEIGHT>});
<STOP>
<BUTTON_CB>
// Common Button callback
bool CbBtnCommon(void* pvGui,void *pvElemRef,gslc_teTouch eTouch,int16_t nX,int16_t nY)
{
  gslc_tsElemRef* pElemRef = (gslc_tsElemRef*)(pvElemRef);
  gslc_tsElem* pElem = pElemRef->pElem;

  if ( eTouch == GSLC_TOUCH_UP_IN ) {
    // From the element's ID we can determine which button was pressed.
    switch (pElem->nId) {
//<Button Enums !Start!>
//<Button Enums !End!>
      default:
        break;
    }
  }
  return true;
}
<STOP>
<BUTTON_CB_LOOP>
      case $<WIDGET_ENUM>:
        //TODO- Replace with button handling code
        break;
<STOP>
<BUTTON_CB_CHGPAGE>
      case $<WIDGET_ENUM>:
        gslc_SetPageCur(&m_gui,$<PAGE_ENUM>);
        break;
<STOP>
<CHECKBOX>
   
  // create checkbox $<WIDGET_ENUM>
  pElemRef = gslc_ElemXCheckboxCreate(&m_gui,$<WIDGET_ENUM>,$<PAGE_ENUM>,&m_asXCheck[$<COUNT>],
    (gslc_tsRect){$<X>,$<Y>,$<WIDTH>,$<HEIGHT>},false,GSLCX_CHECKBOX_STYLE_X,$<MARK_COLOR>,$<CHECKED>);
<STOP>
<COLOR>
  gslc_ElemSetCol(&m_gui,pElemRef,$<FRAME_COLOR>,$<FILL_COLOR>,$<GLOW_COLOR>);
<STOP>
<DRAWFUNC>
  // Set the callback function to handle all drawing for the element
  gslc_ElemSetDrawFunc(&m_gui,pElemRef,&CbDrawScanner);
<STOP>
<DEFINE_PG_MAX>
#define MAX_ELEM_$<STRIP_ENUM> $<COUNT>
#define MAX_ELEM_$<STRIP_ENUM>_RAM MAX_ELEM_$<STRIP_ENUM>
<STOP>
<DRAWBOX_CB>
 
// Scanner drawing callback function
// - This is called when E_ELEM_SCAN is being rendered
bool CbDrawScanner(void* pvGui,void* pvElemRef,gslc_teRedrawType eRedraw)
{
  int nInd;

  // Typecast the parameters to match the GUI and element types
  gslc_tsGui*     pGui      = (gslc_tsGui*)(pvGui);
  gslc_tsElemRef* pElemRef  = (gslc_tsElemRef*)(pvElemRef);
  gslc_tsElem*    pElem     = pElemRef->pElem;

  // Create shorthand variables for the origin
  int16_t  nX = pElem->rElem.x;
  int16_t  nY = pElem->rElem.y;

  // Draw the background
  gslc_tsRect rInside = pElem->rElem;
  rInside = gslc_ExpandRect(rInside,-1,-1);
  gslc_DrawFillRect(pGui,rInside,pElem->colElemFill);

  // Enable localized clipping
  gslc_SetClipRect(pGui,&rInside);

  //TODO - Add your drawing graphic primitives

  // Disable clipping region
  gslc_SetClipRect(pGui,NULL);

  // Draw the frame
  gslc_DrawFrameRect(pGui,pElem->rElem,pElem->colElemFrame);

  // Clear the redraw flag
  gslc_ElemSetRedraw(&m_gui,pElemRef,GSLC_REDRAW_NONE);

  return true;
}
<STOP>
<FONT_LOAD>
    if (!gslc_FontAdd(&m_gui,$<FONT_ID>,$<FONT_REFTYPE>,$<FONT_REF>,$<FONT_SZ>)) { return; }
<STOP>
<GUI_ELEMENT>
gslc_tsElem                 m_asPage$<COUNT>Elem[MAX_ELEM_$<STRIP_ENUM>_RAM];
gslc_tsElemRef              m_asPage$<COUNT>ElemRef[MAX_ELEM_$<STRIP_ENUM>];
<STOP>
<GRAPH>

  // Create graph $<WIDGET_ENUM>
  pElemRef = gslc_ElemXGraphCreate(&m_gui,$<WIDGET_ENUM>,$<PAGE_ENUM>,
    &m_sGraph$<ID>,(gslc_tsRect){$<X>,$<Y>,$<WIDTH>,$<HEIGHT>},$<FONT_ID>,(int16_t*)&m_anGraphBuf$<ID>,
        $<ROWS>,$<GRAPH_COLOR>);
  gslc_ElemXGraphSetStyle(&m_gui,pElemRef, $<STYLE>, 5);
<STOP>
<GROUP>
  gslc_ElemSetGroup(&m_gui,pElemRef,$<GROUP_ID>);
<STOP>
<IMAGE>
 
  // Create $<WIDGET_ENUM> using Image $<IMAGE_DEFINE> $<IMAGE_FROM_SRC>
  pElemRef = gslc_ElemCreateImg(&m_gui,$<WIDGET_ENUM>,$<PAGE_ENUM>,(gslc_tsRect){$<X>,$<Y>,$<WIDTH>,$<HEIGHT>},
    $<IMAGE_SOURCE>$<IMAGE_DEFINE>,$<IMAGE_FORMAT>));
<STOP>
<IMGBUTTON>
  
  // Create $<WIDGET_ENUM> button with image label
  pElemRef = gslc_ElemCreateBtnImg(&m_gui,$<WIDGET_ENUM>,$<PAGE_ENUM>,(gslc_tsRect){$<X>,$<Y>,$<WIDTH>,$<HEIGHT>},
          $<IMAGE_SOURCE>$<IMAGE_DEFINE>,$<IMAGE_FORMAT>),
          $<IMAGE_SEL_SOURCE>$<IMAGE_SEL_DEFINE>,$<IMAGE_FORMAT>),
          &CbBtnCommon);
<STOP>
<IMAGETRANSPARENT>
          gslc_ElemSetFillEn(&m_gui,pElemRef,$<BOOL>);
<STOP>
<PAGEADD>
  gslc_PageAdd(&m_gui,$<PAGE_ENUM>,m_asPage$<COUNT>Elem,MAX_ELEM_$<STRIP_ENUM>_RAM,m_asPage$<COUNT>ElemRef,MAX_ELEM_$<STRIP_ENUM>);
<STOP>
<PAGECUR>
  gslc_SetPageCur(&m_gui,$<PAGE_ENUM>);
<STOP>
<PROGRESSBAR>

  // Create progress bar $<WIDGET_ENUM> 
  pElemRef = gslc_ElemXGaugeCreate(&m_gui,$<WIDGET_ENUM>,$<PAGE_ENUM>,&m_sXGauge[$<COUNT>],
    (gslc_tsRect){$<X>,$<Y>,$<WIDTH>,$<HEIGHT>},$<MIN>,$<MAX>,$<VALUE>,$<MARK_COLOR>,$<CHECKED>);
<STOP>
<PROGRESSBARSTYLE>
  gslc_ElemXGaugeSetStyle(&m_gui,pElemRef, $<STYLE>);
<STOP>
<PROGRESSBARIND>
  gslc_ElemXGaugeSetIndicator(&m_gui,pElemRef,$<MARK_COLOR>,$<SIZE>,$<TIPSZ>,$<CHECKED>));
<STOP>
<PROGRESSBARTICKS>
  gslc_ElemXGaugeSetTicks(&m_gui,pElemRef,$<MARK_COLOR>,$<DIVISIONS>,$<TICKSZ>);
<STOP>
<RADIOBUTTON>
  
  // Create radio button $<WIDGET_ENUM>
  pElemRef = gslc_ElemXCheckboxCreate(&m_gui,$<WIDGET_ENUM>,$<PAGE_ENUM>,&m_asXCheck[$<COUNT>],
    (gslc_tsRect){$<X>,$<Y>,$<WIDTH>,$<HEIGHT>},true,GSLCX_CHECKBOX_STYLE_ROUND,$<MARK_COLOR>,$<CHECKED>);
<STOP>
<ROTATE>
  gslc_GuiRotate(&m_gui, $<ROTATION>);
<STOP>
<SLIDER>

  // Create slider $<WIDGET_ENUM> 
  pElemRef = gslc_ElemXSliderCreate(&m_gui,$<WIDGET_ENUM>,$<PAGE_ENUM>,&m_sXSlider[$<COUNT>],
          (gslc_tsRect){$<X>,$<Y>,$<WIDTH>,$<HEIGHT>},$<MIN>,$<MAX>,$<VALUE>,$<THUMBSZ>,$<CHECKED>);
  gslc_ElemXSliderSetStyle(&m_gui,pElemRef,$<STYLE>,$<TRIM_COLOR>,$<DIVISIONS>,$<TICKSZ>,$<MARK_COLOR>);
  gslc_ElemXSliderSetPosFunc(&m_gui,pElemRef,&CbSlidePos);
<STOP>
<SLIDER_CB>

// Callback function for when a slider's position has been updated
bool CbSlidePos(void* pvGui,void* pvElemRef,int16_t nPos)
{
  gslc_tsGui*     pGui      = (gslc_tsGui*)(pvGui);
  gslc_tsElemRef* pElemRef  = (gslc_tsElemRef*)(pvElemRef);
  gslc_tsElem*    pElem     = pElemRef->pElem;
  int16_t         nVal;

  // From the element's ID we can determine which slider was updated.
  switch (pElem->nId) {
//<Slider Enums !Start!>
//<Slider Enums !End!>
    default:
      break;
  }

  return true;
}
<STOP>
<SLIDER_CB_LOOP>
    case $<WIDGET_ENUM>:
      // Fetch the slider position
      nVal = gslc_ElemXSliderGetPos(pGui,pElemRef);
      //TODO- Replace with slider handling code
      break;
<STOP>
<STARTUP>
  // ------------------------------------------------
  // Start up display on first page
  // ------------------------------------------------
  gslc_SetPageCur(&m_gui,$<PAGE_ENUM>);
<STOP>
<TEXT>
  
  // Create $<WIDGET_ENUM> text label
  pElemRef = gslc_ElemCreateTxt(&m_gui,$<WIDGET_ENUM>,$<PAGE_ENUM>,(gslc_tsRect){$<X>,$<Y>,$<WIDTH>,$<HEIGHT>},
    (char*)"$<TEXT>",0,$<FONT_ID>);
<STOP>
<TEXTBOX>
   
  // Create wrapping box for textbox $<WIDGET_ENUM> and scrollbar
  pElemRef = gslc_ElemCreateBox(&m_gui,GSLC_ID_AUTO,$<PAGE_ENUM>,(gslc_tsRect){$<X>,$<Y>,$<WIDTH>,$<HEIGHT>});
  gslc_ElemSetCol(&m_gui,pElemRef,$<FRAME_COLOR>,$<FILL_COLOR>,$<GLOW_COLOR>);
  
  // Create textbox
  pElemRef = gslc_ElemXTextboxCreate(&m_gui,$<WIDGET_ENUM>,$<PAGE_ENUM>,&m_sTextbox$<ID>,
    (gslc_tsRect){$<X>+2,$<Y>+4,$<WIDTH>-23,$<HEIGHT>-8},$<FONT_ID>,(char*)&m_acTextboxBuf$<ID>,$<ROWS>,$<COLS>);
  gslc_ElemXTextboxWrapSet(&m_gui,pElemRef,$<CHECKED>);
  gslc_ElemSetCol(&m_gui,pElemRef,$<FRAME_COLOR>,$<FILL_COLOR>,$<GLOW_COLOR>);

  // Create vertical scrollbar for textbox
  pElemRef = gslc_ElemXSliderCreate(&m_gui,E_SCROLLBAR$<ID>,$<PAGE_ENUM>,&m_sXSlider[$<COUNT>],
          (gslc_tsRect){$<X>+$<WIDTH>-21,$<Y>+4,20,$<HEIGHT>-8},0,100,0,5,true);
  gslc_ElemSetCol(&m_gui,pElemRef,$<FRAME_COLOR>,$<FILL_COLOR>,$<GLOW_COLOR>);
  gslc_ElemXSliderSetPosFunc(&m_gui,pElemRef,&CbSlidePos);
<STOP>
<TEXT_COLOR>
  gslc_ElemSetTxtCol(&m_gui,pElemRef,$<TEXT_COLOR>);
<STOP>
<TEXT_UPDATE>
  
  // Create $<WIDGET_ENUM> modifiable text label
  static char m_strtxt$<ID>[$<SIZE>] = "$<TEXT>";
  pElemRef = gslc_ElemCreateTxt(&m_gui,$<WIDGET_ENUM>,$<PAGE_ENUM>,(gslc_tsRect){$<X>,$<Y>,$<WIDTH>,$<HEIGHT>},
    (char*)m_strtxt$<ID>,$<SIZE>,$<FONT_ID>);
<STOP>
<TICK_CB>

bool CbTickScanner(void* pvGui,void* pvScope)
{
  gslc_tsGui*   pGui      = (gslc_tsGui*)(pvGui);
  gslc_tsElemRef* pElemRef  = (gslc_tsElemRef*)(pvScope);
  gslc_tsElem*    pElem     = pElemRef->pElem;


  return true;
}
<STOP>
<TICKFUNC>
  // Set the callback function to update content automatically
  gslc_ElemSetTickFunc(&m_gui,pElemRef,&CbTickScanner);
<STOP>
<TXTBUTTON>
  
  // create $<WIDGET_ENUM> button with text label
  pElemRef = gslc_ElemCreateBtnTxt(&m_gui,$<WIDGET_ENUM>,$<PAGE_ENUM>,
    (gslc_tsRect){$<X>,$<Y>,$<WIDTH>,$<HEIGHT>},(char*)"$<TEXT>",0,$<FONT_ID>,&CbBtnCommon);
<STOP>
<TXTBUTTON_UPDATE>
  
  // Create $<WIDGET_ENUM> button with modifiable text label
  static char m_strbtn$<ID>[$<SIZE>] = "$<TEXT>";
  pElemRef = gslc_ElemCreateBtnTxt(&m_gui,$<WIDGET_ENUM>,$<PAGE_ENUM>,
    (gslc_tsRect){$<X>,$<Y>,$<WIDTH>,$<HEIGHT>},
    (char*)m_strbtn$<ID>,$<SIZE>,$<FONT_ID>,&CbBtnCommon);
<STOP>
<END>
