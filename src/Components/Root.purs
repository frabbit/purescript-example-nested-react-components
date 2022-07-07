module Components.Root where

import Prelude

import Components.Container as Container
import Components.Sub as Sub
import Data.Tuple.Nested ((/\))
import Effect.Class (class MonadEffect, liftEffect)
import React.Basic.DOM as R
import React.Basic.Hooks (JSX)
import React.Basic.Hooks as H

component :: forall m . (MonadEffect m) => m (Unit -> JSX)
component = do

  subContainer1 <- liftEffect $ Container.containerStatic
  sub <- liftEffect Sub.component
  subContainer2 <- liftEffect $ Container.container
  liftEffect $ H.component "Root" \_ -> H.do
    val /\ setVal <- H.useState 0
    let props = { val, setVal }
    pure $ R.div { className: "Root", children: [R.text "RootComponent", subContainer1 props, subContainer2 (sub props)]}