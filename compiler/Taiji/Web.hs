module Taiji.Web where

import Hakyll
import Text.Pandoc.Diagrams
import Text.Pandoc.Walk

siteCtx :: Context String
siteCtx =
    constField "baseurl" "/" <>
    defaultContext

blogCtx :: Context String
blogCtx = boolField "sidebar" (const True)

markdownCompiler :: Compiler (Item String)
markdownCompiler = pandocCompilerWithTransformM defaultHakyllReaderOptions
    defaultHakyllWriterOptions (unsafeCompiler . walkM f)
  where
    f blks = concat <$> mapM (insertDiagrams opt) blks
    opt = Opts {
        _outFormat = "png",
        _outDir    = "_diagrams",
        _expression = "example", 
        _absolutePath = False,
        _backend = Cairo
        }
