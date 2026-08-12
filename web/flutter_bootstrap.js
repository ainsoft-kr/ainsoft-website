{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  onEntrypointLoaded: async function (engineInitializer) {
    window.setAinsoftLoadingStatus('렌더링 엔진을 초기화하고 있습니다');
    const appRunner = await engineInitializer.initializeEngine();

    window.setAinsoftLoadingStatus('AINSOFT를 시작하고 있습니다');
    await appRunner.runApp();
    window.hideAinsoftLoading();
  },
});
