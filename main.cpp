#include <iostream>

#include <Wt/WServer.h>
#include <Wt/WConfig.h>
#include <Wt/WWebassembly.h>

using namespace std;
using namespace Wt;

int main(int argc, char **argv)
{
    try {
        //::Configuration conf("server_config.json");

        WServer server(argc, argv, WTHTTP_CONFIGURATION);

        //bool start = server.start();

    }
    catch (WServer::Exception& e) {
        std::cerr << "WServer::Exception: "<< e.what() << "\n";
        return 1;
    }
    catch (std::exception& e) {
        std::cerr << "exception: " << e.what() << "\n";
        return 2;
    }
    return 0;
}
