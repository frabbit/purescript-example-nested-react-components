module Components.Container where

import Prelude

import Components.Sub (SubProps)
import Components.Sub as Sub
import Effect.Class (class MonadEffect, liftEffect)
import React.Basic.DOM as R
import React.Basic.Hooks (JSX)
import React.Basic.Hooks as H

containerStatic :: forall m . (MonadEffect m) => m (SubProps -> JSX)
containerStatic = do
  subComp <- liftEffect $ Sub.component
  liftEffect $ H.component "ContainerStatic" \props -> React.do
    pure $ R.div { className: "ContainerStatic", children: [R.text "ContainerStatic", subComp props]}

containerDynamic :: forall m . (MonadEffect m) => m (JSX -> JSX)
containerDynamic = do
  liftEffect $ H.component "Container" \child -> React.do
    pure $ R.div { className: "ContainerDynamic", children: [R.text "Container Dynamic", child]}