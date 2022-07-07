module Components.Root where

import Prelude

import Components.Container as Container
import Components.Sub as Sub
import Effect.Class (class MonadEffect, liftEffect)
import React.Basic.DOM as R
import React.Basic.Hooks (JSX)
import React.Basic.Hooks as H

component :: forall m . (MonadEffect m) => m (Unit -> JSX)
component = do
  subContainer1 <- liftEffect $ Container.containerStatic
  sub <- liftEffect Sub.component
  subContainer2 <- liftEffect $ Container.container (sub unit)
  liftEffect $ H.component "Root" \_ -> React.do
    pure $ R.div_ [R.text "RootComponent", subContainer1 unit, subContainer2 unit]