//******************************************************************************
//
// Copyright (c) Microsoft. All rights reserved.
//
// This code is licensed under the MIT License (MIT).
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//******************************************************************************
#include <TestFramework.h>
#import <UIKit/UISlider.h>

#include <COMIncludes.h>
#import <WRLHelpers.h>
#import <ErrorHandling.h>
#import <RawBuffer.h>
#import <wrl/client.h>
#import <wrl/implements.h>
#import <wrl/async.h>
#import <wrl/wrappers/corewrappers.h>
#import <windows.foundation.h>
#include <COMIncludes_end.h>

#include "ObjCXamlControls.h"
#import "UWP/WindowsUIXamlControls.h"

TEST(UISlider, CreateXamlElement) {
    dispatch_sync(dispatch_get_main_queue(),
                  ^{
                      // TODO: Switch to UIKit.Xaml projections when they're available.
                      Microsoft::WRL::ComPtr<IInspectable> xamlElement(XamlCreateSlider());
                      ASSERT_TRUE(xamlElement);
                  });
}

TEST(UISlider, GetXamlElement) {
    dispatch_sync(dispatch_get_main_queue(),
                  ^{
                      UIView* view = [[[UISlider alloc] init] autorelease];
                      WXFrameworkElement* backingElement = [view xamlElement];
                      ASSERT_TRUE(backingElement);

                      // TODO: Fix up when UISlider moves fully to XAML
                      ASSERT_TRUE([backingElement isKindOfClass:[WXCGrid class]]);
                  });
}
