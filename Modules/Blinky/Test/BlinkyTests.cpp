extern "C" {
// Add headers here
#include "Blinky.h"
}

#include "CppUTest/TestHarness.h"
#include "CppUTestExt/MockSupport.h"

TEST_GROUP(BlinkyTests)
{
    void setup()
    {
    }

    void teardown()
    {
        mock().clear();
        MemoryLeakWarningPlugin::restoreNewDeleteOverloads();
    }
}; // TEST_GROUP(BlinkyTests)

TEST(BlinkyTests, CheckNew)
{
    Blinky_t b;
    memset(&b, 0xaa, sizeof b);

    Blinky_New(&b);
    CHECK(true);
} // TEST(BlinkyTests)
