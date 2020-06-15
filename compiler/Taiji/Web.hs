{-# LANGUAGE OverloadedStrings #-}
module Taiji.Web where

import Hakyll
import Text.Pandoc.Diagrams
import Text.Pandoc.Walk
import Text.Pandoc.Options
import Data.List

siteCtx :: Context String
siteCtx =
    constField "baseurl" "/" <>
    defaultContext

blogCtx :: Context String
blogCtx = boolField "sidebar" (const True)

markdownCompiler :: Compiler (Item String)
markdownCompiler = pandocCompilerWithTransformM defaultHakyllReaderOptions
    writerOptions
    (unsafeCompiler . walkM f)
  where
    f blks = concat <$> mapM (insertDiagrams opt) blks
    opt = Opts {
        _outFormat = "png",
        _outDir    = "_diagrams",
        _expression = "example", 
        _absolutePath = False,
        _backend = Cairo
        }
    ext = foldr enableExtension (writerExtensions defaultHakyllWriterOptions)
        [Ext_tex_math_dollars,Ext_tex_math_double_backslash,Ext_latex_macros]
    writerOptions = defaultHakyllWriterOptions {
      writerExtensions = ext,
      writerHTMLMathMethod = MathJax ""
      }
