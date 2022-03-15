package main

import (
	"fmt"
	"net/http"

	"github.com/prometheus/common/version"
	kingpin "gopkg.in/alecthomas/kingpin.v2"
)

var (
	listenAddr = kingpin.Flag("web.listen-addr", "web listen address").Default(":12306").String()
	metricPath = kingpin.Flag("web.metric-path", "path for metric endpoint").Default("/metrics").String()
	configFile = kingpin.Flag("meta.config-file", "configuration file path").Default("/etc/whitebox/config.yaml")
	checkCmd   = kingpin.Command("check", "validate configuration")
	checkFile  = checkCmd.Arg("c", "configuration file").String()
)

func init() {
	kingpin.Version(version.Print("whitebox_exporter"))
	kingpin.VersionFlag.Short('v')
	kingpin.Parse()
}

// metric handler
type handler struct {
}

func (h handler) ServeHTTP(writer http.ResponseWriter, request *http.Request) {
	// TODO implement me
	panic("implement me")
}

func newHandler() *handler {
	return &handler{}
}

func main() {
	switch kingpin.Parse() {
	case checkCmd.FullCommand():
		// check conf
		fmt.Println("ok")
		return
	}
	if err := http.ListenAndServe(*listenAddr, newHandler()); err != nil {
		return
	}
}
