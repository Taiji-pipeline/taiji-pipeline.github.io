{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid ((<>))
import           Hakyll
import Hakyll.Web.Sass (sassCompilerWith, sassDefConfig, SassOptions(..))

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

    match "web/static/js/*" $ do
        route $ gsubRoute "web/" (const "")
        compile copyFileCompiler

    match "web/pages/*.md" $ do
        route $ composeRoutes (gsubRoute "web/pages/" $ const "") $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "web/templates/default.html" defaultContext
            >>= relativizeUrls

    match "web/pages/*.html" $ do
        route $ gsubRoute "web/pages/" $ const ""
        compile $ do
            getResourceBody
                >>= loadAndApplyTemplate "web/templates/default.html" defaultContext
                >>= relativizeUrls

