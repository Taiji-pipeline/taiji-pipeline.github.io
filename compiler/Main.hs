{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid ((<>))
import           Hakyll
import Hakyll.Web.Sass (sassCompilerWith, sassDefConfig, SassOptions(..))
import qualified Data.Text as T
import Data.Maybe

import Taiji.Web

saasOptions = sassDefConfig
    { sassIncludePaths      = Just [ "third_party/foundation-sites/scss"
                                   , "third_party/motion-ui/src" ]
    }

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "web/templates/*" $ compile templateBodyCompiler

    match "web/static/img/*" $ do
        route $ gsubRoute "web/" (const "")
        compile copyFileCompiler

    match "web/static/css/*.css" $ do
        route $ gsubRoute "web/" (const "")
        compile copyFileCompiler

    match "web/static/css/app.scss" $ do
        route $ composeRoutes (gsubRoute "web/" (const "")) $ setExtension "css"
        compile $ sassCompilerWith saasOptions

    match "third_party/foundation-sites/dist/js/foundation.min.js" $ do
        route $ constRoute "static/js/foundation.min.js"
        compile copyFileCompiler

    match "web/static/js/*" $ do
        route $ gsubRoute "web/" (const "")
        compile copyFileCompiler

    match "web/pages/*.md" $ do
        route $ composeRoutes (gsubRoute "web/pages/" $ const "") $
            setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "web/templates/default.html" siteCtx
            >>= relativizeUrls

    match "web/pages/blog/*.md" $ do
        route $ composeRoutes (gsubRoute "web/pages/blog/" $ const "blog_") $
            setExtension "html"
        compile $ do
            doc <- pandocCompiler
            let ctx = field "id" (return . getName . itemBody) <>
                    boolField "active" ((==itemIdentifier doc) . fst . itemBody) <>
                    field "title" (return . fromMaybe "Untitled" . lookupString "title" . snd . itemBody)
                getName (x,_) = T.unpack $ T.init $ fst $ T.breakOnEnd "." $ snd $
                    T.breakOnEnd "/" $ T.pack $ toFilePath x
            loadAndApplyTemplate "web/templates/default.html" 
                (listField "posts" ctx
                    (mapM makeItem =<< getAllMetadata "web/pages/blog/*.md")
                        <> blogCtx <> siteCtx) doc >>= relativizeUrls

    match "web/pages/*.html" $ do
        route $ gsubRoute "web/pages/" $ const ""
        compile $ do
            getResourceBody
                >>= loadAndApplyTemplate "web/templates/default.html" siteCtx
                >>= relativizeUrls

