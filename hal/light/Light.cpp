/*
 * Copyright (C) 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "LightHAL"
#include <log/log.h>
#include <stdlib.h>

#include "Light.h"

namespace android {
namespace hardware {
namespace light {
namespace V2_0 {
namespace implementation {

using namespace android::hardware;

Light::Light(void)
{
    mMaxValue = 255;
    mBrightnessPath = "/sys/class/backlight/backlight/brightness";
    mMaxBrightnessPath = "/sys/class/backlight/backlight/max_brightness";

    char buffer[8] = {0};
    mFd = open(mMaxBrightnessPath.c_str(), O_RDONLY);
    if (mFd >= 0) {
        if (read(mFd, buffer, 4) > 0) {
            mMaxValue = atoi(buffer);
            ALOGI("Max brightness value %d", mMaxValue);
        }
        close(mFd);
    } else {
        ALOGE("Open '%s' failed (errno=%d), using default %d",
            mMaxBrightnessPath.c_str(), -errno, mMaxValue);
    }

    mFd = open(mBrightnessPath.c_str(), O_WRONLY);
    if (mFd < 0) {
        ALOGE("Open '%s' failed (errno=%d), backlight control will not work",
            mBrightnessPath.c_str(), -errno);
    }
}

// Methods from ::android::hardware::light::V2_0::ILight follow.
Return<light::V2_0::Status> Light::setLight(light::V2_0::Type type, const light::V2_0::LightState& state)
{
    if (type != Type::BACKLIGHT || mFd < 0) {
        return Status::LIGHT_NOT_SUPPORTED;
    }

    uint8_t value = (state.color & 0xff);
    if( value > mMaxValue ) value = mMaxValue;

    char buffer[8] = {0};
    sprintf(buffer, "%d", value);
    write(mFd, buffer, strlen(buffer));
    return Status::SUCCESS;
}

Return<void> Light::getSupportedTypes(getSupportedTypes_cb _hidl_cb)
{
    _hidl_cb(hidl_vec<Type>{Type::BACKLIGHT});
    return Void();
}

}  // namespace implementation
}  // namespace V2_0
}  // namespace light
}  // namespace hardware
}  // namespace android
