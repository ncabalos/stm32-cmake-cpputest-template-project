extern "C" {
// Add headers here
}

#include "CppUTest/TestHarness.h"
#include "CppUTestExt/MockSupport.h"

TEST_GROUP(SampleTests)
{
    void setup()
    {
    }

    void teardown()
    {
        mock().clear();
        MemoryLeakWarningPlugin::restoreNewDeleteOverloads();
    }
}; // TEST_GROUP(SampleTests)

TEST(SampleTests, SampleTest)
{
    CHECK(true);
} // TEST(SampleTests)
