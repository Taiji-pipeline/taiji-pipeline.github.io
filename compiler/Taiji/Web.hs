module Taiji.Web where

import Hakyll

siteCtx :: Context String
siteCtx =
    constField "baseurl" "/" <>
    defaultContext

blogCtx :: Context String
blogCtx = boolField "sidebar" (const True)
