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

-- Module      : Network.AWS.S3.PutObject
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Adds an object to a bucket.
module Network.AWS.S3.PutObject
    (
    -- * Request
      PutObject
    -- ** Request constructor
    , putObject
    -- ** Request lenses
    , poACL
    , poBody
    , poBucket
    , poCacheControl
    , poContentDisposition
    , poContentEncoding
    , poContentLanguage
    , poContentLength
    , poContentMD5
    , poContentType
    , poExpires
    , poGrantFullControl
    , poGrantRead
    , poGrantReadACP
    , poGrantWriteACP
    , poKey
    , poMetadata
    , poSSECustomerAlgorithm
    , poSSECustomerKey
    , poSSECustomerKeyMD5
    , poServerSideEncryption
    , poStorageClass
    , poWebsiteRedirectLocation

    -- * Response
    , PutObjectOutput
    -- ** Response constructor
    , putObjectOutput
    -- ** Response lenses
    , pooETag
    , pooExpiration
    , pooSSECustomerAlgorithm
    , pooSSECustomerKeyMD5
    , pooServerSideEncryption
    , pooVersionId
    ) where

import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.S3.Types

data PutObject = PutObject
    { _poACL                     :: Maybe Text
    , _poBody                    :: RqBody
    , _poBucket                  :: Text
    , _poCacheControl            :: Maybe Text
    , _poContentDisposition      :: Maybe Text
    , _poContentEncoding         :: Maybe Text
    , _poContentLanguage         :: Maybe Text
    , _poContentLength           :: Maybe Int
    , _poContentMD5              :: Maybe Text
    , _poContentType             :: Maybe Text
    , _poExpires                 :: Maybe RFC822
    , _poGrantFullControl        :: Maybe Text
    , _poGrantRead               :: Maybe Text
    , _poGrantReadACP            :: Maybe Text
    , _poGrantWriteACP           :: Maybe Text
    , _poKey                     :: Text
    , _poMetadata                :: Map Text Text
    , _poSSECustomerAlgorithm    :: Maybe Text
    , _poSSECustomerKey          :: Maybe (Sensitive Text)
    , _poSSECustomerKeyMD5       :: Maybe Text
    , _poServerSideEncryption    :: Maybe Text
    , _poStorageClass            :: Maybe Text
    , _poWebsiteRedirectLocation :: Maybe Text
    } deriving (Show, Generic)

-- | 'PutObject' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'poACL' @::@ 'Maybe' 'Text'
--
-- * 'poBody' @::@ 'RqBody'
--
-- * 'poBucket' @::@ 'Text'
--
-- * 'poCacheControl' @::@ 'Maybe' 'Text'
--
-- * 'poContentDisposition' @::@ 'Maybe' 'Text'
--
-- * 'poContentEncoding' @::@ 'Maybe' 'Text'
--
-- * 'poContentLanguage' @::@ 'Maybe' 'Text'
--
-- * 'poContentLength' @::@ 'Maybe' 'Int'
--
-- * 'poContentMD5' @::@ 'Maybe' 'Text'
--
-- * 'poContentType' @::@ 'Maybe' 'Text'
--
-- * 'poExpires' @::@ 'Maybe' 'UTCTime'
--
-- * 'poGrantFullControl' @::@ 'Maybe' 'Text'
--
-- * 'poGrantRead' @::@ 'Maybe' 'Text'
--
-- * 'poGrantReadACP' @::@ 'Maybe' 'Text'
--
-- * 'poGrantWriteACP' @::@ 'Maybe' 'Text'
--
-- * 'poKey' @::@ 'Text'
--
-- * 'poMetadata' @::@ 'HashMap' 'Text' 'Text'
--
-- * 'poSSECustomerAlgorithm' @::@ 'Maybe' 'Text'
--
-- * 'poSSECustomerKey' @::@ 'Maybe' 'Text'
--
-- * 'poSSECustomerKeyMD5' @::@ 'Maybe' 'Text'
--
-- * 'poServerSideEncryption' @::@ 'Maybe' 'Text'
--
-- * 'poStorageClass' @::@ 'Maybe' 'Text'
--
-- * 'poWebsiteRedirectLocation' @::@ 'Maybe' 'Text'
--
putObject :: RqBody -- ^ 'poBody'
          -> Text -- ^ 'poBucket'
          -> Text -- ^ 'poKey'
          -> PutObject
putObject p1 p2 p3 = PutObject
    { _poBody                    = p1
    , _poBucket                  = p2
    , _poKey                     = p3
    , _poACL                     = Nothing
    , _poCacheControl            = Nothing
    , _poContentDisposition      = Nothing
    , _poContentEncoding         = Nothing
    , _poContentLanguage         = Nothing
    , _poContentLength           = Nothing
    , _poContentMD5              = Nothing
    , _poContentType             = Nothing
    , _poExpires                 = Nothing
    , _poGrantFullControl        = Nothing
    , _poGrantRead               = Nothing
    , _poGrantReadACP            = Nothing
    , _poGrantWriteACP           = Nothing
    , _poMetadata                = mempty
    , _poServerSideEncryption    = Nothing
    , _poStorageClass            = Nothing
    , _poWebsiteRedirectLocation = Nothing
    , _poSSECustomerAlgorithm    = Nothing
    , _poSSECustomerKey          = Nothing
    , _poSSECustomerKeyMD5       = Nothing
    }

-- | The canned ACL to apply to the object.
poACL :: Lens' PutObject (Maybe Text)
poACL = lens _poACL (\s a -> s { _poACL = a })

poBody :: Lens' PutObject RqBody
poBody = lens _poBody (\s a -> s { _poBody = a })

poBucket :: Lens' PutObject Text
poBucket = lens _poBucket (\s a -> s { _poBucket = a })

-- | Specifies caching behavior along the request/reply chain.
poCacheControl :: Lens' PutObject (Maybe Text)
poCacheControl = lens _poCacheControl (\s a -> s { _poCacheControl = a })

-- | Specifies presentational information for the object.
poContentDisposition :: Lens' PutObject (Maybe Text)
poContentDisposition =
    lens _poContentDisposition (\s a -> s { _poContentDisposition = a })

-- | Specifies what content encodings have been applied to the object and thus
-- what decoding mechanisms must be applied to obtain the media-type
-- referenced by the Content-Type header field.
poContentEncoding :: Lens' PutObject (Maybe Text)
poContentEncoding =
    lens _poContentEncoding (\s a -> s { _poContentEncoding = a })

-- | The language the content is in.
poContentLanguage :: Lens' PutObject (Maybe Text)
poContentLanguage =
    lens _poContentLanguage (\s a -> s { _poContentLanguage = a })

-- | Size of the body in bytes. This parameter is useful when the size of the
-- body cannot be determined automatically.
poContentLength :: Lens' PutObject (Maybe Int)
poContentLength = lens _poContentLength (\s a -> s { _poContentLength = a })

poContentMD5 :: Lens' PutObject (Maybe Text)
poContentMD5 = lens _poContentMD5 (\s a -> s { _poContentMD5 = a })

-- | A standard MIME type describing the format of the object data.
poContentType :: Lens' PutObject (Maybe Text)
poContentType = lens _poContentType (\s a -> s { _poContentType = a })

-- | The date and time at which the object is no longer cacheable.
poExpires :: Lens' PutObject (Maybe UTCTime)
poExpires = lens _poExpires (\s a -> s { _poExpires = a })
    . mapping _Time

-- | Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the
-- object.
poGrantFullControl :: Lens' PutObject (Maybe Text)
poGrantFullControl =
    lens _poGrantFullControl (\s a -> s { _poGrantFullControl = a })

-- | Allows grantee to read the object data and its metadata.
poGrantRead :: Lens' PutObject (Maybe Text)
poGrantRead = lens _poGrantRead (\s a -> s { _poGrantRead = a })

-- | Allows grantee to read the object ACL.
poGrantReadACP :: Lens' PutObject (Maybe Text)
poGrantReadACP = lens _poGrantReadACP (\s a -> s { _poGrantReadACP = a })

-- | Allows grantee to write the ACL for the applicable object.
poGrantWriteACP :: Lens' PutObject (Maybe Text)
poGrantWriteACP = lens _poGrantWriteACP (\s a -> s { _poGrantWriteACP = a })

poKey :: Lens' PutObject Text
poKey = lens _poKey (\s a -> s { _poKey = a })

-- | A map of metadata to store with the object in S3.
poMetadata :: Lens' PutObject (HashMap Text Text)
poMetadata = lens _poMetadata (\s a -> s { _poMetadata = a })
    . _Map

-- | Specifies the algorithm to use to when encrypting the object (e.g.,
-- AES256).
poSSECustomerAlgorithm :: Lens' PutObject (Maybe Text)
poSSECustomerAlgorithm =
    lens _poSSECustomerAlgorithm (\s a -> s { _poSSECustomerAlgorithm = a })

-- | Specifies the customer-provided encryption key for Amazon S3 to use in
-- encrypting data. This value is used to store the object and then it is
-- discarded; Amazon does not store the encryption key. The key must be
-- appropriate for use with the algorithm specified in the
-- x-amz-server-side&#x200B;-encryption&#x200B;-customer-algorithm header.
poSSECustomerKey :: Lens' PutObject (Maybe Text)
poSSECustomerKey = lens _poSSECustomerKey (\s a -> s { _poSSECustomerKey = a })
    . mapping _Sensitive

-- | Specifies the 128-bit MD5 digest of the encryption key according to RFC
-- 1321. Amazon S3 uses this header for a message integrity check to ensure
-- the encryption key was transmitted without error.
poSSECustomerKeyMD5 :: Lens' PutObject (Maybe Text)
poSSECustomerKeyMD5 =
    lens _poSSECustomerKeyMD5 (\s a -> s { _poSSECustomerKeyMD5 = a })

-- | The Server-side encryption algorithm used when storing this object in S3.
poServerSideEncryption :: Lens' PutObject (Maybe Text)
poServerSideEncryption =
    lens _poServerSideEncryption (\s a -> s { _poServerSideEncryption = a })

-- | The type of storage to use for the object. Defaults to 'STANDARD'.
poStorageClass :: Lens' PutObject (Maybe Text)
poStorageClass = lens _poStorageClass (\s a -> s { _poStorageClass = a })

-- | If the bucket is configured as a website, redirects requests for this
-- object to another object in the same bucket or to an external URL. Amazon
-- S3 stores the value of this header in the object metadata.
poWebsiteRedirectLocation :: Lens' PutObject (Maybe Text)
poWebsiteRedirectLocation =
    lens _poWebsiteRedirectLocation
        (\s a -> s { _poWebsiteRedirectLocation = a })

instance ToPath PutObject where
    toPath PutObject{..} = mconcat
        [ "/"
        , toText _poBucket
        , "/"
        , toText _poKey
        ]

instance ToQuery PutObject where
    toQuery = const mempty

instance ToHeaders PutObject where
    toHeaders PutObject{..} = mconcat
        [ "x-amz-acl"                                       =: _poACL
        , "Cache-Control"                                   =: _poCacheControl
        , "Content-Disposition"                             =: _poContentDisposition
        , "Content-Encoding"                                =: _poContentEncoding
        , "Content-Language"                                =: _poContentLanguage
        , "Content-Length"                                  =: _poContentLength
        , "Content-MD5"                                     =: _poContentMD5
        , "Content-Type"                                    =: _poContentType
        , "Expires"                                         =: _poExpires
        , "x-amz-grant-full-control"                        =: _poGrantFullControl
        , "x-amz-grant-read"                                =: _poGrantRead
        , "x-amz-grant-read-acp"                            =: _poGrantReadACP
        , "x-amz-grant-write-acp"                           =: _poGrantWriteACP
        , "x-amz-meta-"                                     =: _poMetadata
        , "x-amz-server-side-encryption"                    =: _poServerSideEncryption
        , "x-amz-storage-class"                             =: _poStorageClass
        , "x-amz-website-redirect-location"                 =: _poWebsiteRedirectLocation
        , "x-amz-server-side-encryption-customer-algorithm" =: _poSSECustomerAlgorithm
        , "x-amz-server-side-encryption-customer-key"       =: _poSSECustomerKey
        , "x-amz-server-side-encryption-customer-key-MD5"   =: _poSSECustomerKeyMD5
        ]

instance ToBody PutObject where
    toBody = toBody . _poBody

data PutObjectOutput = PutObjectOutput
    { _pooETag                 :: Maybe Text
    , _pooExpiration           :: Maybe RFC822
    , _pooSSECustomerAlgorithm :: Maybe Text
    , _pooSSECustomerKeyMD5    :: Maybe Text
    , _pooServerSideEncryption :: Maybe Text
    , _pooVersionId            :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'PutObjectOutput' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'pooETag' @::@ 'Maybe' 'Text'
--
-- * 'pooExpiration' @::@ 'Maybe' 'UTCTime'
--
-- * 'pooSSECustomerAlgorithm' @::@ 'Maybe' 'Text'
--
-- * 'pooSSECustomerKeyMD5' @::@ 'Maybe' 'Text'
--
-- * 'pooServerSideEncryption' @::@ 'Maybe' 'Text'
--
-- * 'pooVersionId' @::@ 'Maybe' 'Text'
--
putObjectOutput :: PutObjectOutput
putObjectOutput = PutObjectOutput
    { _pooExpiration           = Nothing
    , _pooETag                 = Nothing
    , _pooServerSideEncryption = Nothing
    , _pooVersionId            = Nothing
    , _pooSSECustomerAlgorithm = Nothing
    , _pooSSECustomerKeyMD5    = Nothing
    }

-- | Entity tag for the uploaded object.
pooETag :: Lens' PutObjectOutput (Maybe Text)
pooETag = lens _pooETag (\s a -> s { _pooETag = a })

-- | If the object expiration is configured, this will contain the expiration
-- date (expiry-date) and rule ID (rule-id). The value of rule-id is URL
-- encoded.
pooExpiration :: Lens' PutObjectOutput (Maybe UTCTime)
pooExpiration = lens _pooExpiration (\s a -> s { _pooExpiration = a })
    . mapping _Time

-- | If server-side encryption with a customer-provided encryption key was
-- requested, the response will include this header confirming the
-- encryption algorithm used.
pooSSECustomerAlgorithm :: Lens' PutObjectOutput (Maybe Text)
pooSSECustomerAlgorithm =
    lens _pooSSECustomerAlgorithm (\s a -> s { _pooSSECustomerAlgorithm = a })

-- | If server-side encryption with a customer-provided encryption key was
-- requested, the response will include this header to provide round trip
-- message integrity verification of the customer-provided encryption key.
pooSSECustomerKeyMD5 :: Lens' PutObjectOutput (Maybe Text)
pooSSECustomerKeyMD5 =
    lens _pooSSECustomerKeyMD5 (\s a -> s { _pooSSECustomerKeyMD5 = a })

-- | The Server-side encryption algorithm used when storing this object in S3.
pooServerSideEncryption :: Lens' PutObjectOutput (Maybe Text)
pooServerSideEncryption =
    lens _pooServerSideEncryption (\s a -> s { _pooServerSideEncryption = a })

-- | Version of the object.
pooVersionId :: Lens' PutObjectOutput (Maybe Text)
pooVersionId = lens _pooVersionId (\s a -> s { _pooVersionId = a })

instance AWSRequest PutObject where
    type Sv PutObject = S3
    type Rs PutObject = PutObjectOutput

    request  = put
    response = const . xmlResponse $ \h x -> PutObjectOutput
record
