{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE NoImplicitPrelude          #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE RecordWildCards            #-}
{-# LANGUAGE TypeFamilies               #-}

-- {-# OPTIONS_GHC -fno-warn-unused-imports #-}
-- {-# OPTIONS_GHC -fno-warn-unused-binds  #-} doesnt work if wall is used
{-# OPTIONS_GHC -w #-}

-- Module      : Network.AWS.S3.GetObjectAcl
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns the access control list (ACL) of an object.
module Network.AWS.S3.GetObjectAcl
    (
    -- * Request
      GetObjectAcl
    -- ** Request constructor
    , getObjectAcl
    -- ** Request lenses
    , goaBucket
    , goaKey
    , goaVersionId

    -- * Response
    , GetObjectAclOutput
    -- ** Response constructor
    , getObjectAclOutput
    -- ** Response lenses
    , goaoGrants
    , goaoOwner
    ) where

import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.S3.Types

data GetObjectAcl = GetObjectAcl
    { _goaBucket    :: Text
    , _goaKey       :: Text
    , _goaVersionId :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'GetObjectAcl' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'goaBucket' @::@ 'Text'
--
-- * 'goaKey' @::@ 'Text'
--
-- * 'goaVersionId' @::@ 'Maybe' 'Text'
--
getObjectAcl :: Text -- ^ 'goaBucket'
             -> Text -- ^ 'goaKey'
             -> GetObjectAcl
getObjectAcl p1 p2 = GetObjectAcl
    { _goaBucket    = p1
    , _goaKey       = p2
    , _goaVersionId = Nothing
    }

goaBucket :: Lens' GetObjectAcl Text
goaBucket = lens _goaBucket (\s a -> s { _goaBucket = a })

goaKey :: Lens' GetObjectAcl Text
goaKey = lens _goaKey (\s a -> s { _goaKey = a })

-- | VersionId used to reference a specific version of the object.
goaVersionId :: Lens' GetObjectAcl (Maybe Text)
goaVersionId = lens _goaVersionId (\s a -> s { _goaVersionId = a })

instance ToPath GetObjectAcl where
    toPath GetObjectAcl{..} = mconcat
        [ "/"
        , toText _goaBucket
        , "/"
        , toText _goaKey
        ]

instance ToQuery GetObjectAcl where
    toQuery GetObjectAcl{..} = mconcat
        [ "acl"
        , "versionId" =? _goaVersionId
        ]

instance ToHeaders GetObjectAcl

data GetObjectAclOutput = GetObjectAclOutput
    { _goaoGrants :: [Grant]
    , _goaoOwner  :: Maybe Owner
    } deriving (Eq, Show, Generic)

-- | 'GetObjectAclOutput' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'goaoGrants' @::@ ['Grant']
--
-- * 'goaoOwner' @::@ 'Maybe' 'Owner'
--
getObjectAclOutput :: GetObjectAclOutput
getObjectAclOutput = GetObjectAclOutput
    { _goaoOwner  = Nothing
    , _goaoGrants = mempty
    }

-- | A list of grants.
goaoGrants :: Lens' GetObjectAclOutput [Grant]
goaoGrants = lens _goaoGrants (\s a -> s { _goaoGrants = a })

goaoOwner :: Lens' GetObjectAclOutput (Maybe Owner)
goaoOwner = lens _goaoOwner (\s a -> s { _goaoOwner = a })

instance AWSRequest GetObjectAcl where
    type Sv GetObjectAcl = S3
    type Rs GetObjectAcl = GetObjectAclOutput

    request  = get
    response = const . xmlResponse $ \h x -> GetObjectAclOutput
record
