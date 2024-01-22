#include <iostream>

#include <Wt/WServer.h>
#include <Wt/WConfig.h>
#include <Wt/WWebassembly.h>
#include <Wt/WText.h>

using namespace std;
using namespace Wt;


awaitable<std::unique_ptr<Wt::WApplication>> createApplication(const WEnvironment& env)
{
    std::cerr << "createApplication" << std::endl;

    auto app = std::make_unique<WApplication>(env);
    auto root = app->root();
    //app->enableUpdates();

    app->instance()->setTitle("Testing Page");

    root->addWidget(std::make_unique<WText>("HELLO WORLD"));

    auto wasm = root->addWidget(std::make_unique<WWebassembly>("webassembly", "./webassembly/webassembly", "app/webassembly"));
    wasm->decorationStyle().setBackgroundColor(WColor(StandardColor::Cyan));
    wasm->resize(800, 600);
    co_return app;
}

int main(int argc, char **argv)
{

    try {
        //::Configuration conf("server_config.json");

        WServer server(argc, argv, WTHTTP_CONFIGURATION);

        server.addEntryPoint(EntryPointType::Application, std::bind(createApplication, std::placeholders::_1), "/app");

        std::string pp = "./webassembly/webassembly";
        auto wasmresource = new WMemoryResource("application/wasm",  pp + ".wasm");
        server.addResource(wasmresource, "webassembly.wasm");

        auto jsresource = new WMemoryResource("application/javascript", pp + ".js");
        server.addResource(jsresource, "webassembly.js");

        if (server.start()) {
            int sig = Wt::WServer::waitForShutdown();

            std::cerr << "Shutdown (signal = " << sig << ")" << std::endl;
            server.stop();
        }

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
