module Components.Sub where

import Prelude

import React.Basic.DOM as R
import React.Basic.Hooks as H

component :: H.Component Unit
component = do
  H.component "WritePanel" \_ -> React.do
    pure $ R.div_ [R.text "Hello I'm a Sub-Component"]