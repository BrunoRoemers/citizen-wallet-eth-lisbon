import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';

class WalletConnectService {
  final String projectId;
  Web3Wallet? _cachedClient;

  WalletConnectService(this.projectId);

  Future<Web3Wallet> _getClient() async {
    if (_cachedClient == null) {
      _cachedClient = await Web3Wallet.createInstance(
        relayUrl: 'wss://relay.walletconnect.com',
        projectId: projectId,
        metadata: const PairingMetadata(
          name: 'Citizen Wallet',
          description: 'A wallet for your community',
          url: 'https://citizenwallet.xyz',
          icons: ['https://app.citizenwallet.xyz/full_logo.png'],
        ),
        logLevel: LogLevel.verbose,
      );

      _cachedClient!.onSessionProposal.subscribe(_handleSessionProposal);
      _cachedClient!.onSessionProposalError
          .subscribe(_handleSessionProposalError);
    }

    return Future(() => _cachedClient!);
  }

  void _handleSessionProposal(SessionProposalEvent? e) {
    print('session proposal');
    print(e); // TODO
  }

  void _handleSessionProposalError(SessionProposalErrorEvent? e) {
    print('session proposal error');
  }

  pair(Uri uri) async {
    var client = await _getClient();
    var pairInfo = await client.pair(uri: uri);
    print(pairInfo); // TODO
  }
}
