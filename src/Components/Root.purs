module Components.Root where

import Prelude

import Components.Sub as Sub
import React.Basic.DOM as R
import React.Basic.Hooks as H

component :: H.Component Unit
component = do
  subComp <- Sub.component
  H.component "WritePanel" \_ -> React.do
    pure $ R.div_ [R.text "Hello World", subComp unit]