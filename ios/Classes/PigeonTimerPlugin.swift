import Flutter
import UIKit


public class PigeonTimerPlugin: NSObject, FlutterPlugin, TimerHostApi {
    var stopwatch : StopwatchTimer? = nil
    static var timerListenerApi : TimerListenerApi? = nil
    
    public static func register(with registrar: any FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : TimerHostApi & NSObjectProtocol & FlutterPlugin = PigeonTimerPlugin.init()
        TimerHostApiSetup.setUp(binaryMessenger: messenger, api: api)
        PigeonTimerPlugin.timerListenerApi = TimerListenerApi(binaryMessenger: messenger)
        registrar.addApplicationDelegate(api)
    }
    
    
    func initTimer() throws {
        stopwatch = StopwatchTimer()
        
        stopwatch!.onValueChanged = { newValue in
            print("Counter updated: \(newValue)")
            PigeonTimerPlugin.timerListenerApi?.onTick(value: Int64(newValue), completion: { _ in })
            PigeonTimerPlugin.timerListenerApi?.onTickComplex(value: ComplexValue(value: Int64(newValue), platformName: "iOS"), completion: { _ in })
        }
    }
    
    func start() throws {
        if( stopwatch == nil){
            print("stopwatch is null")
            return;
        }
        stopwatch?.start()
    }
    
    func stop() throws {
        stopwatch?.stop()
    }
    
    func getPlatformVersion() throws -> String {
        return "iOS " + UIDevice.current.systemVersion;
    }
    
    func askImportantQuestion(question: Question, completion: @escaping (Result<Answer, any Error>) -> Void) {
        var bigBrain = BigBrain()
        bigBrain.getAnswer = { answerText in
            completion(Result.success(Answer(text: answerText)));
        }
        bigBrain.askQuestion(questionText: question.text)
    }
}
