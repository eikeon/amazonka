{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.S3.V2006_03_01.DeleteBucketTagging
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes the tags from the bucket.
module Network.AWS.S3.V2006_03_01.DeleteBucketTagging where

import           Control.Applicative
import           Data.ByteString      (ByteString)
import           Data.Default
import           Data.HashMap.Strict  (HashMap)
import           Data.Monoid
import           Data.Text            (Text)
import qualified Data.Text            as Text
import           GHC.Generics
import           Network.AWS.Data
import           Network.AWS.Response
import           Network.AWS.Types    hiding (Error)
import           Network.AWS.Request.RestS3
import           Network.AWS.S3.V2006_03_01.Types
import           Network.HTTP.Client  (RequestBody, Response)
import           Prelude              hiding (head)

data DeleteBucketTagging = DeleteBucketTagging
    { _dbtrBucket :: BucketName
    } deriving (Generic)

instance ToPath DeleteBucketTagging where
    toPath DeleteBucketTagging{..} = mconcat
        [ "/"
        , toBS _dbtrBucket
        ]

instance ToQuery DeleteBucketTagging

instance ToHeaders DeleteBucketTagging

instance ToBody DeleteBucketTagging

instance AWSRequest DeleteBucketTagging where
    type Sv DeleteBucketTagging = S3
    type Rs DeleteBucketTagging = DeleteBucketTaggingResponse

    request = delete
    response _ _ = return (Right DeleteBucketTaggingResponse)

data DeleteBucketTaggingResponse = DeleteBucketTaggingResponse
    deriving (Eq, Show, Generic)
