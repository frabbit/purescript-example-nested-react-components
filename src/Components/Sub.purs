module Components.Sub where

import Prelude

import Effect.Class (class MonadEffect, liftEffect)
import React.Basic.DOM as R
import React.Basic.Hooks (JSX)
import React.Basic.Hooks as H

component :: forall m . Monad m => MonadEffect m => m (Unit -> JSX)
component = do
  liftEffect $ H.component "Sub" \_ -> React.do
    pure $ R.div_ [R.text "Hello I'm a Sub-Component"]