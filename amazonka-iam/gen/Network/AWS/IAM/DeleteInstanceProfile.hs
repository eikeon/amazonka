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

-- Module      : Network.AWS.IAM.DeleteInstanceProfile
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes the specified instance profile. The instance profile must not have
-- an associated role. Make sure you do not have any Amazon EC2 instances
-- running with the instance profile you are about to delete. Deleting a role
-- or instance profile that is associated with a running instance will break
-- any applications running on the instance. For more information about
-- instance profiles, go to About Instance Profiles.
module Network.AWS.IAM.DeleteInstanceProfile
    (
    -- * Request
      DeleteInstanceProfile
    -- ** Request constructor
    , deleteInstanceProfile
    -- ** Request lenses
    , dipInstanceProfileName

    -- * Response
    , DeleteInstanceProfileResponse
    -- ** Response constructor
    , deleteInstanceProfileResponse
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.Query
import Network.AWS.IAM.Types

newtype DeleteInstanceProfile = DeleteInstanceProfile
    { _dipInstanceProfileName :: Text
    } deriving (Eq, Ord, Show, Generic, Monoid)

-- | 'DeleteInstanceProfile' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dipInstanceProfileName' @::@ 'Text'
--
deleteInstanceProfile :: Text -- ^ 'dipInstanceProfileName'
                      -> DeleteInstanceProfile
deleteInstanceProfile p1 = DeleteInstanceProfile
    { _dipInstanceProfileName = p1
    }

-- | The name of the instance profile to delete.
dipInstanceProfileName :: Lens' DeleteInstanceProfile Text
dipInstanceProfileName =
    lens _dipInstanceProfileName (\s a -> s { _dipInstanceProfileName = a })

instance ToPath DeleteInstanceProfile where
    toPath = const "/"

instance ToQuery DeleteInstanceProfile

data DeleteInstanceProfileResponse = DeleteInstanceProfileResponse

-- | 'DeleteInstanceProfileResponse' constructor.
deleteInstanceProfileResponse :: DeleteInstanceProfileResponse
deleteInstanceProfileResponse = DeleteInstanceProfileResponse

instance AWSRequest DeleteInstanceProfile where
    type Sv DeleteInstanceProfile = IAM
    type Rs DeleteInstanceProfile = DeleteInstanceProfileResponse

    request  = post "DeleteInstanceProfile"
    response = const (nullaryResponse DeleteInstanceProfileResponse)
