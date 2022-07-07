module Components.Sub where

import Prelude

import Effect (Effect)
import Effect.Class (class MonadEffect, liftEffect)
import React.Basic.DOM as R
import React.Basic.Events (handler_)
import React.Basic.Hooks (JSX)
import React.Basic.Hooks as H

type SubProps = { val :: Int, setVal :: (Int -> Int) -> Effect Unit}

component :: forall m . Monad m => MonadEffect m => m (SubProps -> JSX)
component = do
  liftEffect $ H.component "Sub" \{val, setVal} -> H.do
    pure $ R.div {
      className: "Sub",
      children: [ R.text $ "Hello I'm a Sub-Component - Value " <> (show val)
      , R.button
        { onClick: handler_ (setVal (_ + 1) )
        , className: "IncrementButton"
        , children: [R.text "increment"]
        }
      ]}