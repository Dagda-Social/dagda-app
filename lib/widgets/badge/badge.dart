import 'package:dagda/widgets/bottom_sheets/bottom_sheet.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.badge,
  }) : super(key: key);

  final String badge;

  @override
  Widget build(BuildContext context) {
    Color _badgeColor = Colors.purple;
    String _badgeText = '';
    String _badgeDescription = '';
    IconData _badgeIcon = Icons.verified_rounded;

    if (badge == 'verified') {
      _badgeColor = Colors.blue;
      _badgeText = 'This Account is Verified';
      _badgeDescription =
          'This account is verified by Dagda. This means that Dagda has confirmed that this is the authentic account of the person or organization that it represents.';
      _badgeIcon = Icons.verified_rounded;
    }
    if (badge == 'developer') {
      _badgeColor = Colors.red;
      _badgeText = 'This Account is a Developer of dagda';
      _badgeDescription =
          'This account is a verified developer. This means that this account is a developer of Dagda.';
      _badgeIcon = Icons.code_rounded;
    }
    if (badge == 'sponsor') {
      _badgeColor = Colors.green;
      _badgeText = 'This Account support dagda on Github Sponsors';
      _badgeDescription =
          'This account support dagda on Github Sponsors. This means that this account is supporting Dagda financially.';
      _badgeIcon = Icons.favorite_rounded;
    }

    return GestureDetector(
      onTap: () => bottomSheet(
        context,
        [
          const SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.center,
              child: Icon(
                _badgeIcon,
                color: _badgeColor,
                size: 80,
              )),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
            child: Text(
              _badgeText,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
            child: Text(
              _badgeDescription,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 4),
        child: Icon(
          _badgeIcon,
          color: _badgeColor,
          size: 24,
        ),
      ),
    );
  }
}
