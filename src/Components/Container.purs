module Components.Container where

import Prelude

import Components.Sub as Sub
import Effect.Class (class MonadEffect, liftEffect)
import React.Basic.DOM as R
import React.Basic.Hooks (JSX)
import React.Basic.Hooks as H

containerStatic :: forall m . (MonadEffect m) => m (Unit -> JSX)
containerStatic = do
  subComp <- liftEffect $ Sub.component
  liftEffect $ H.component "ContainerStatic" \_ -> React.do
    pure $ R.div_ [R.text "ContainerStatic", subComp unit]

container :: forall m . (MonadEffect m) => JSX -> m (Unit -> JSX)
container child = do
  liftEffect $ H.component "Container" \_ -> React.do
    pure $ R.div_ [R.text "Container Dynamic", child]