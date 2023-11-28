# myapp
### Phase 1
- [x] crate a GitHub repo to work on
- [x] create streamlit project to show a simple hello world project
- [ ] create a nginx image and host change there
- [ ] create a jfrog artifactory and connect it with gradle to store artifacts
- [ ] create service from above using dockerfile and include istio proxy to converse with <figure>

### Phase 2
- [ ] add security to all above steps using snyk tool
- [ ] if possible, host you application on aws cloud
- [ ] create a jenkins or spinnaker pipeline



### Phase 3
- [ ] create a small Highly available kubernetes cluster using terraform
- [x] add some gradle code to work with it (maybe create some java code to work with)
- [X] create github actions to trigger. so as soon as PR is merged, it triggers some builds into artifactory (CI)