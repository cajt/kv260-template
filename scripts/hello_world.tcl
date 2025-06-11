
setws ./build/workspace
app create -name hello -hw ./build/design_1_wrapper.xsa -proc psu_cortexa53_0 -os standalone -lang C -template {Hello World}
app build -name hello
