// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ja';

  static String m0(characterName) =>
      "まだチャットがありません。\n${characterName}と新しいチャットを開始してください";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("アカウント"),
        "appTitle": MessageLookupByLibrary.simpleMessage("チャッタークラフティング"),
        "appTitleEN": MessageLookupByLibrary.simpleMessage("ChatterCrafting"),
        "background": MessageLookupByLibrary.simpleMessage("背景"),
        "backingUp": MessageLookupByLibrary.simpleMessage("チャットをバックアップ中.."),
        "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
        "chatBackup": MessageLookupByLibrary.simpleMessage("チャットのバックアップ"),
        "chatBackupConfirm": MessageLookupByLibrary.simpleMessage(
            "チャットをバックアップしますか？ すでにサーバー上にバックアップデータがある場合、これにより上書きされます。"),
        "chatGPTDefaultCharacterName":
            MessageLookupByLibrary.simpleMessage("ChatGPT"),
        "chatGPTServer":
            MessageLookupByLibrary.simpleMessage("ChatGPTサーバーが現在過負荷です。"),
        "chatInputHint": MessageLookupByLibrary.simpleMessage("メッセージを入力..."),
        "chatOption": MessageLookupByLibrary.simpleMessage("チャット"),
        "chatPlaceHolderMessage": m0,
        "chatRestore": MessageLookupByLibrary.simpleMessage("チャットの復元"),
        "chatRestoreConfirm": MessageLookupByLibrary.simpleMessage(
            "サーバーにバックアップしたチャットを復元しますか？ 既存のローカルデータが上書きされ、復元後にアプリが再起動します。"),
        "chatRoomSetting": MessageLookupByLibrary.simpleMessage("チャットルームの設定"),
        "chatRooms": MessageLookupByLibrary.simpleMessage("チャットルーム"),
        "chatTitle": MessageLookupByLibrary.simpleMessage("チャット"),
        "chatroomBackgroundColor":
            MessageLookupByLibrary.simpleMessage("チャットルームの背景色"),
        "chatroomDefaultMessage":
            MessageLookupByLibrary.simpleMessage("まだ誰もこのルームでチャットしていません。"),
        "chatroomPlaceholder":
            MessageLookupByLibrary.simpleMessage("まだチャットルームがありません :)"),
        "chatterChatBoxBackgroundColor":
            MessageLookupByLibrary.simpleMessage("チャッターのチャットボックス背景色"),
        "chatterCode": MessageLookupByLibrary.simpleMessage("チャッターコード"),
        "chatterCodeExplain": MessageLookupByLibrary.simpleMessage(
            "このチャッターコードを他の人と共有することができます。 (このチャッターコードは一週間だけ有効です)"),
        "chatterCodeInvalid":
            MessageLookupByLibrary.simpleMessage("このチャッターコードは無効です。"),
        "chatterCraftingBackupPolicy1": MessageLookupByLibrary.simpleMessage(
            "· チャッタークラフティングは自動的にチャットをサーバーにバックアップしません。別のデバイスでチャットデータを復元する場合は、手動でチャットをバックアップしてから復元できます。"),
        "chatterCraftingBackupPolicy2": MessageLookupByLibrary.simpleMessage(
            "· チャットのバックアップと復元は、1日に5回の操作に制限されていることをご注意ください"),
        "chatterFontColor":
            MessageLookupByLibrary.simpleMessage("チャッターのフォントカラー"),
        "chatterFontSize":
            MessageLookupByLibrary.simpleMessage("チャッターのフォントサイズ"),
        "chatterPrompt": MessageLookupByLibrary.simpleMessage("チャッターの説明プロンプト"),
        "chatterPromptHint": MessageLookupByLibrary.simpleMessage(
            "このプロンプトはあなたのチャッターに関するものです。チャッターの性格、背景、または含めたい他の何かについて説明してください！"),
        "chatterRecognizeUserName":
            MessageLookupByLibrary.simpleMessage("あなたが認識される名前"),
        "chatterTitle": MessageLookupByLibrary.simpleMessage("チャッター"),
        "chatters": MessageLookupByLibrary.simpleMessage("チャッター"),
        "colors": MessageLookupByLibrary.simpleMessage("色相"),
        "contextPrompt": MessageLookupByLibrary.simpleMessage("Context Prompt"),
        "contextPromptHint":
            MessageLookupByLibrary.simpleMessage("Context Prompt hint here"),
        "copyChatOption": MessageLookupByLibrary.simpleMessage("コピー"),
        "defaultCharacterBoyDescription": MessageLookupByLibrary.simpleMessage(
            "<chatter>は優しい心を持っている人です。 <chatter>は<user>の友人です。 <chatter>は常に友人の困難に共感し、耳を傾ける準備ができています。"),
        "defaultCharacterBoyName":
            MessageLookupByLibrary.simpleMessage("キャラクターB"),
        "defaultCharacterGirlDescription": MessageLookupByLibrary.simpleMessage(
            "<chatter>はエネルギーに満ち溢れており、天性の外向的な性格を持っています。 <chatter>は<user>の友達です。 <chatter>は友達と一緒に過ごし、おしゃべりをすることが大好きです。 <chatter>は他人の話に本当に興味を持っています。"),
        "defaultCharacterGirlFirstMessage":
            MessageLookupByLibrary.simpleMessage("こんにちは！お元気ですか？"),
        "defaultCharacterGirlName":
            MessageLookupByLibrary.simpleMessage("キャラクターA"),
        "defaultCharacterSystemPrompt": MessageLookupByLibrary.simpleMessage(
            "<chatter>と<user>の間の会話を作成しなさい。"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("アカウント削除"),
        "deleteAccountConfirm": MessageLookupByLibrary.simpleMessage(
            "チャッタークラフティングからあなたのアカウントデータを削除しますか？全てのチャットデータが削除され、アプリは再起動します。"),
        "deleteAccountPolicy1": MessageLookupByLibrary.simpleMessage(
            "· これにより、あなたのチャッタークラフティングのアカウントデータが削除されます。"),
        "deleteAccountPolicy2": MessageLookupByLibrary.simpleMessage(
            "· アカウントが削除された後、全てのチャットデータが削除され、アプリは再起動します。"),
        "deleteChatOption": MessageLookupByLibrary.simpleMessage("削除"),
        "deleteChatroom": MessageLookupByLibrary.simpleMessage("チャットを削除"),
        "deleteChatroomConfirm": MessageLookupByLibrary.simpleMessage(
            "チャットの削除を確認しますか？\nすべてのチャット履歴が失われます！"),
        "deleteChatter": MessageLookupByLibrary.simpleMessage("チャッターを削除"),
        "deleteChatterConfirm": MessageLookupByLibrary.simpleMessage(
            "チャッターの削除を確認しますか？\nすべてのチャット履歴が失われます！"),
        "deleteOption": MessageLookupByLibrary.simpleMessage("削除"),
        "deleting": MessageLookupByLibrary.simpleMessage("アカウントデータを削除中..."),
        "description": MessageLookupByLibrary.simpleMessage("説明"),
        "descriptionHint": MessageLookupByLibrary.simpleMessage(
            "チャッターの性格、背景、または他の任意の情報について記述してください！"),
        "done": MessageLookupByLibrary.simpleMessage("完了"),
        "doneExc": MessageLookupByLibrary.simpleMessage("完了しました！"),
        "doneRestart": MessageLookupByLibrary.simpleMessage("完了！\nアプリを再起動中.."),
        "eULA": MessageLookupByLibrary.simpleMessage("EULA"),
        "editChatOption": MessageLookupByLibrary.simpleMessage("編集"),
        "editProfile": MessageLookupByLibrary.simpleMessage("プロフィール編集"),
        "enableMarkdownRendering":
            MessageLookupByLibrary.simpleMessage("マークダウンを有効"),
        "exitApp": MessageLookupByLibrary.simpleMessage("アプリを終了"),
        "exitAppConfirm":
            MessageLookupByLibrary.simpleMessage("本当にアプリを終了しますか？"),
        "export": MessageLookupByLibrary.simpleMessage("輸出"),
        "exportConfirm": MessageLookupByLibrary.simpleMessage(
            "チャターをエクスポートしますか？これにより、共有可能なチャターコードが作成されます。"),
        "exporting": MessageLookupByLibrary.simpleMessage("エクスポート中.."),
        "firstMessageHint": MessageLookupByLibrary.simpleMessage(
            "ご希望であれば、チャッターの最初のメッセージをカスタマイズすることができます。希望しない場合は空白にしていただいて構いません。"),
        "firstMessageLabel":
            MessageLookupByLibrary.simpleMessage("チャッターの最初のメッセージ"),
        "fontSize": MessageLookupByLibrary.simpleMessage("フォントサイズ"),
        "googlePaLM": MessageLookupByLibrary.simpleMessage("Google (PaLM)"),
        "import": MessageLookupByLibrary.simpleMessage("輸入"),
        "importing": MessageLookupByLibrary.simpleMessage("インポート中.."),
        "instructionSystemPrompt":
            MessageLookupByLibrary.simpleMessage("指示システムプロンプト"),
        "instructionSystemPromptHint": MessageLookupByLibrary.simpleMessage(
            "ChatGPTに何をして欲しいのかを指示するプロンプトを提供します。たとえば、ここで「ロールプレイをして」と言うと、ChatGPTは最善を尽くしてロールプレイをします。"),
        "insufficientTokenGem": MessageLookupByLibrary.simpleMessage(
            "十分なトークンジェムがありません！チャットを続けるためには、より多くのトークンジェムを購入してください。"),
        "isSaved": MessageLookupByLibrary.simpleMessage("が保存されました."),
        "later": MessageLookupByLibrary.simpleMessage("後で"),
        "manageAPIKey": MessageLookupByLibrary.simpleMessage("APIキー管理"),
        "moreTitle": MessageLookupByLibrary.simpleMessage("もっと"),
        "name": MessageLookupByLibrary.simpleMessage("名前"),
        "neverLeakAPIKey":
            MessageLookupByLibrary.simpleMessage("APIキーを決して他の場所に漏らさないでください!"),
        "newChatter": MessageLookupByLibrary.simpleMessage("新しいチャッター"),
        "no": MessageLookupByLibrary.simpleMessage("いいえ"),
        "noChatterFound":
            MessageLookupByLibrary.simpleMessage("チャッターが見つかりません！"),
        "noDataFound":
            MessageLookupByLibrary.simpleMessage("バックアップされたチャットはありません！"),
        "openAI": MessageLookupByLibrary.simpleMessage("OpenAI (ChatGPT)"),
        "openAIAPIKey": MessageLookupByLibrary.simpleMessage("OpenAI API キー"),
        "openAIAPIKeyErrorTitle":
            MessageLookupByLibrary.simpleMessage("無効なOpenAI APIキー"),
        "openAIAPIisInvalid": MessageLookupByLibrary.simpleMessage(
            "OpenAI APIキーが無効です。登録できるページに移動しますか?"),
        "openAIAPIisNotRegistered": MessageLookupByLibrary.simpleMessage(
            "OpenAI APIキーはまだ登録されていません。登録できるページに移動しますか？"),
        "operationFailed": MessageLookupByLibrary.simpleMessage("操作に失敗しました！"),
        "os": MessageLookupByLibrary.simpleMessage("OS"),
        "paLMAPIKey": MessageLookupByLibrary.simpleMessage("PaLM API キー"),
        "paLMAPIKeyErrorTitle":
            MessageLookupByLibrary.simpleMessage("無効なPaLM APIキー"),
        "paLMAPIisInvalid": MessageLookupByLibrary.simpleMessage(
            "あなたのPaLM APIキーは無効です。それを登録することができるページに行きたいですか？"),
        "paLMContextPromptHint": MessageLookupByLibrary.simpleMessage(
            "PaLMに何をすべきか指示するためのプロンプトです。例えば、「ロールプレイをしろ」と指示すると、PaLMはロールプレイング（ロールプレイ）を試みます。"),
        "paLMContextPromptLabel":
            MessageLookupByLibrary.simpleMessage("コンテキストプロンプト"),
        "paLMExampleInputHint":
            MessageLookupByLibrary.simpleMessage("サンプル入力を記入してください。"),
        "paLMExampleInputLabel": MessageLookupByLibrary.simpleMessage("サンプル入力"),
        "paLMExampleOutputHint": MessageLookupByLibrary.simpleMessage(
            "サンプル入力に対してPaLMが回答として生成するように推奨するサンプルの回答を記入してください。"),
        "paLMExampleOutputLabel":
            MessageLookupByLibrary.simpleMessage("サンプル回答"),
        "paLMExamplePromptHint": MessageLookupByLibrary.simpleMessage(
            "このプロンプトは、PaLMに生成するように推奨するサンプルの会話を提供します。入力と回答のサンプルプロンプトは同時に提供する必要があります。このプロンプトを入力したくない場合は、フィールドをすべて空にしてください。"),
        "paLMExamplePromptLabel":
            MessageLookupByLibrary.simpleMessage("サンプル会話プロンプト"),
        "pasteAPIKey":
            MessageLookupByLibrary.simpleMessage("APIキーをここに貼り付けてください"),
        "pasteCode":
            MessageLookupByLibrary.simpleMessage("ここにチャターコードを貼り付けてください"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("プライバシーポリシー"),
        "reachedBackupLimit": MessageLookupByLibrary.simpleMessage(
            "あなたは一日の制限に達しました！チャットのバックアップと復元は1日に最大5回まで可能です。ご不便をおかけして申し訳ありません。"),
        "registerAPI": MessageLookupByLibrary.simpleMessage("登録する"),
        "resetToDefaults": MessageLookupByLibrary.simpleMessage("デフォルトの初期化"),
        "restoringChat": MessageLookupByLibrary.simpleMessage("チャットを復元中.."),
        "searchChatter": MessageLookupByLibrary.simpleMessage("チャッター名を検索"),
        "selectModel": MessageLookupByLibrary.simpleMessage("モデルを選択"),
        "signInCanceled":
            MessageLookupByLibrary.simpleMessage("サインインがキャンセルされました"),
        "signInFail": MessageLookupByLibrary.simpleMessage("サインイン失敗"),
        "signInSuccess": MessageLookupByLibrary.simpleMessage("サインイン成功"),
        "signInWithApple": MessageLookupByLibrary.simpleMessage("Appleでサインイン"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Googleでサインイン"),
        "spendingHistory": MessageLookupByLibrary.simpleMessage("利用履歴"),
        "temperatureLabel":
            MessageLookupByLibrary.simpleMessage("Temperature (ランダム性)"),
        "textIsPasted": MessageLookupByLibrary.simpleMessage("テキストが貼り付けられました"),
        "toastSelectStaticImage": MessageLookupByLibrary.simpleMessage(
            "GIFのようなフォーマットではなく、静止画像を選択してください！"),
        "tokenReachedLimitation": MessageLookupByLibrary.simpleMessage(
            "トークンジェムの購入が一時的にできなくなっています。ご迷惑をおかけして申し訳ございませんが、復旧まで最善を尽くします。"),
        "totalUsedTokenGem":
            MessageLookupByLibrary.simpleMessage("合計使用トークンジェム"),
        "updateAvailable": MessageLookupByLibrary.simpleMessage("更新が利用可能です"),
        "updateAvailableExplain": MessageLookupByLibrary.simpleMessage(
            "アプリの新しいバージョンが利用可能です。アプリを更新してください。"),
        "updateNow": MessageLookupByLibrary.simpleMessage("今すぐ更新"),
        "usagePolicy": MessageLookupByLibrary.simpleMessage("利用規約"),
        "usagePolicy1": MessageLookupByLibrary.simpleMessage(
            "私たちのアプリケーション（「アプリ」）は、ユーザーがテキストベースの会話を通じてバーチャルキャラクターとコミュニケーションを取るためのプラットフォームを提供します。この利用規約は、私たちのアプリの利用を規定します。"),
        "usagePolicy10": MessageLookupByLibrary.simpleMessage("5. 利用規約の変更"),
        "usagePolicy11": MessageLookupByLibrary.simpleMessage(
            "私たちはこのページを修正することにより、いつでもこの利用規約を改訂することができます。あなたは定期的にこのページを確認し、我々が行った変更を確認することが期待されます。これらは法的にあなたに対して拘束力があります。"),
        "usagePolicy12":
            MessageLookupByLibrary.simpleMessage("6. 第三者のサービスとAPI"),
        "usagePolicy13": MessageLookupByLibrary.simpleMessage(
            "私たちのアプリのサービスを提供する上で、私たちはChatGPTのAPIを利用しています。したがって、私たちはChatGPTの利用規約に従っています。ChatGPTの利用規約は "),
        "usagePolicy14": MessageLookupByLibrary.simpleMessage("こちら"),
        "usagePolicy15": MessageLookupByLibrary.simpleMessage(
            "で確認することができます。当社のアプリを利用することで、あなたはまた、ChatGPTの利用規約を遵守することに同意します。\nあなたが第三者のサービスやAPIを利用することは、そのような第三者サービスに適用される利用規約、プライバシーポリシー、その他のポリシーと契約に従うことを含みます。それらの文書を注意深く読むことをお勧めします。"),
        "usagePolicy2": MessageLookupByLibrary.simpleMessage("1. 利用規約の承認"),
        "usagePolicy3": MessageLookupByLibrary.simpleMessage(
            "当社のアプリを利用することで、あなたはこの利用規約を承認し、それに従うことに同意したことになります。このポリシーに同意できない場合は、当社のアプリを利用することはできません。将来参照するために、この利用規約のコピーを印刷することをお勧めします。"),
        "usagePolicy4": MessageLookupByLibrary.simpleMessage("2. 禁止事項"),
        "usagePolicy5": MessageLookupByLibrary.simpleMessage(
            "当社のアプリは、法的に許可された目的のみで使用することができます。あなたは当社のアプリを次のような目的で使用してはなりません：\n- 適用可能な地方、国内、国際法または規制に違反する方法で。\n- 内容規定に違反するマテリアルを送信、受信、アップロード、ダウンロード、使用、または再使用する。\n- 承認されていない広告や宣伝材料、または他の類似した勧誘（スパム）の送信または送信の手配を行う。"),
        "usagePolicy6": MessageLookupByLibrary.simpleMessage("3. コンテンツ基準"),
        "usagePolicy7": MessageLookupByLibrary.simpleMessage(
            "これらのコンテンツ基準は、アプリのすべてのユーザー生成コンテンツに適用されます。ユーザー生成コンテンツは以下を含んではいけません：\n- 名誉毀損的、わいせつ的、攻撃的、憎悪的、または炎上を引き起こす可能性のある素材。\n- 性的に露骨な素材、暴力、または人種、性別、宗教、国籍、障害、性的指向、年齢に基づく差別を促進するもの。\n- 他の人の著作権、データベースの権利、または商標を侵害するもの。\n- 他人を欺く可能性がある、または他人にな"),
        "usagePolicy8": MessageLookupByLibrary.simpleMessage("4. この利用規約の違反"),
        "usagePolicy9": MessageLookupByLibrary.simpleMessage(
            "この利用規約に違反した場合、それはあなたが私たちのアプリを利用するために許可されている利用規約の重大な違反を構成し、私たちは以下の全てまたはいずれかの行動を取る可能性があります：\n- あなたのアプリ利用権の即時、一時的、または恒久的な取り消し。\n- 違反から生じた全費用の補償基準に基づく法的手続き。\n- あなたに対するさらなる法的行動。\n私たちは、この利用規約の違反に対する対応として取られた行動に対する責任を排除します。"),
        "usagePolicySubTitle": MessageLookupByLibrary.simpleMessage(
            "チャッタークラフティング ChatterCrafting 利用規約"),
        "usagePolicyTitle": MessageLookupByLibrary.simpleMessage("利用規約"),
        "userChatBoxBackgroundColor":
            MessageLookupByLibrary.simpleMessage("ユーザーのチャットボックス背景色"),
        "userFontColor": MessageLookupByLibrary.simpleMessage("ユーザーのフォントカラー"),
        "userFontSize": MessageLookupByLibrary.simpleMessage("ユーザーのフォントサイズ"),
        "yes": MessageLookupByLibrary.simpleMessage("はい")
      };
}
