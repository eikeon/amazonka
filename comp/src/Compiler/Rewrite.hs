{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE RecordWildCards   #-}

-- Module      : Compiler.Rewrite
-- Copyright   : (c) 2013-2015 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Compiler.Rewrite where

import           Compiler.AST
import           Compiler.Rewrite.Default
import           Compiler.Rewrite.Override
import           Compiler.Rewrite.Subst
import           Compiler.Types
import           Control.Error
import           Control.Lens
import           Control.Monad
import           Data.Functor.Identity
import qualified Data.HashMap.Strict       as Map
import qualified Data.HashSet              as Set
import           Data.List                 (sort)
import           Data.Monoid
import           Data.Text                 (Text)
import qualified Data.Text.Lazy            as LText

createLibrary :: Monad m
              => Versions
              -> API Maybe Ref
              -> EitherT LazyText m Library
createLibrary v x = do
    y <- defaults (substitute x)

    let stem   = NS ["Network", "AWS", y ^. serviceAbbrev]
        other  = x ^. operationImports ++ x ^. typeImports
        expose = stem
               : stem <> "Types"
               : stem <> "Waiters"
               : map (mappend stem . textToNS)
                     (y ^.. operations . ifolded . asIndex)

    return $! Library y v (sort expose) (sort other)

-- AST.hs
-- Constraint.hs
-- TypeOf.hs

-- Rewrite.hs
-- Rewrite/Default.hs
-- Rewrite/Override.hs
-- Rewrite/Sharing.hs
-- Rewrite/Elaborate.hs
-- Rewrite/Disambiguate.hs

-- Rewrite.hs: rewrite process:
-- 1. set defaults (Default)
-- 2. apply overrides (Override)
--  - Fields:
--    *  mark required fields
--    * mark fields optional
--    * rename fields
--    * retype fields
--    * prefix enums
--  - Types:
--    * rename types
--    * replace types
-- 3. determine sharing (Share)
-- 4. create/insert request + response shapes (Elaborate)
-- 5. generate unique prefixes (Prefix)
-- 6. generate shape->constraint index (Index)
-- 7. generate shape->type index (Index)
