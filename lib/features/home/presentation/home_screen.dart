import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  static const actions = [
    QuickActionData(
      icon: Icons.add_rounded,
      label: 'Add money',
      backgroundColor: Color(0xFFEAF0FF),
      iconColor: Color(0xFF2563FF),
    ),
    QuickActionData(
      icon: Icons.north_east_rounded,
      label: 'Transfer',
      backgroundColor: Color(0xFFE8FBF6),
      iconColor: Color(0xFF0F9F7F),
    ),
    QuickActionData(
      icon: Icons.qr_code_scanner_rounded,
      label: 'Pay',
      backgroundColor: Color(0xFFF3EEFF),
      iconColor: Color(0xFF7C3AED),
    ),
    QuickActionData(
      icon: Icons.swap_horiz_rounded,
      label: 'Exchange',
      backgroundColor: Color(0xFFEAF8FF),
      iconColor: Color(0xFF0891B2),
    ),
  ];

  static const transactions = [
    TransactionData(
      title: 'Spotify',
      subtitle: 'Music subscription',
      amount: '- \$12.99',
      color: Color(0xFF1DB954),
      isPositive: false,
    ),
    TransactionData(
      title: 'Dribbble',
      subtitle: 'Design membership',
      amount: '- \$24.00',
      color: Color(0xFFFF5A5F),
      isPositive: false,
    ),
    TransactionData(
      title: 'Salary',
      subtitle: 'Incoming transfer',
      amount: '+ \$3,420.00',
      color: Color(0xFF2563FF),
      isPositive: true,
    ),
    TransactionData(
      title: 'Starbucks',
      subtitle: 'Coffee',
      amount: '- \$5.45',
      color: Color(0xFF0F9F7F),
      isPositive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                children: const [
                  _Header(),
                  SizedBox(height: 24),
                  _BalanceCard(),
                  SizedBox(height: 20),
                  _QuickActions(),
                  SizedBox(height: 20),
                  _CardsSection(),
                  SizedBox(height: 20),
                  _TransactionsSection(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: _BottomNav(
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: const Color(0xFF6B7280)),
              ),
              const SizedBox(height: 6),
              Text(
                'Welcome back, Muhammad',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF111827),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [_softShadow],
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF0FF),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [_softShadow],
          ),
          child: const Icon(Icons.person_rounded, color: Color(0xFF2563FF)),
        ),
      ],
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E4FE0),
            Color(0xFF2563FF),
            Color(0xFF13B8A6),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x332563FF),
            blurRadius: 30,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total balance',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '\$24,735.48',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16),
          _BalanceChangePill(),
          SizedBox(height: 22),
          Row(
            children: [
              Expanded(
                child: _BalanceMetric(
                  label: 'Available cash',
                  value: '\$18,231.67',
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _BalanceMetric(
                  label: 'Savings vault',
                  value: '\$6,503.81',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BalanceChangePill extends StatelessWidget {
  const _BalanceChangePill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(999),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_upward_rounded,
            size: 16,
            color: Color(0xFFB8FFE9),
          ),
          SizedBox(width: 6),
          Text(
            '8.42% this month',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _BalanceMetric extends StatelessWidget {
  const _BalanceMetric({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    final items = _HomeScreenState.actions;

    return Row(
      children: List.generate(items.length, (index) {
        final action = items[index];

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: index == items.length - 1 ? 0 : 12),
            child: _QuickActionCard(action: action),
          ),
        );
      }),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({
    required this.action,
  });

  final QuickActionData action;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x120F172A),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: action.backgroundColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              action.icon,
              size: 24,
              color: action.iconColor,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            action.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardsSection extends StatelessWidget {
  const _CardsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          title: 'Your cards',
          actionLabel: 'Manage',
        ),
        const SizedBox(height: 14),
        Container(
          height: 200,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0F172A),
                Color(0xFF1F2937),
                Color(0xFF111827),
              ],
            ),
            boxShadow: const [_softShadow],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Auro Black',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.wifi_rounded, color: Colors.white),
                ],
              ),
              Spacer(),
              Text(
                '**** 2490',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'M. YUSUF',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'VISA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TransactionsSection extends StatelessWidget {
  const _TransactionsSection();

  @override
  Widget build(BuildContext context) {
    final items = _HomeScreenState.transactions;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [_softShadow],
      ),
      child: Column(
        children: [
          const _SectionHeader(
            title: 'Recent transactions',
            actionLabel: 'See all',
          ),
          const SizedBox(height: 18),
          ...List.generate(
            items.length,
                (index) => Padding(
              padding: EdgeInsets.only(
                bottom: index == items.length - 1 ? 0 : 16,
              ),
              child: _TransactionTile(item: items[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({
    required this.item,
  });

  final TransactionData item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: item.color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.payments_outlined,
            color: item.color,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF111827),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ),
        Text(
          item.amount,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: item.isPositive
                ? const Color(0xFF0F9F7F)
                : const Color(0xFF111827),
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.actionLabel,
  });

  final String title;
  final String actionLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Text(
          actionLabel,
          style: const TextStyle(
            color: Color(0xFF2563FF),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    const items = [
      BottomNavItem(icon: Icons.home_rounded, label: 'Home'),
      BottomNavItem(icon: Icons.pie_chart_rounded, label: 'Analytics'),
      BottomNavItem(icon: Icons.credit_card_rounded, label: 'Cards'),
      BottomNavItem(icon: Icons.person_rounded, label: 'Profile'),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [_softShadow],
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final item = items[index];
          final selected = currentIndex == index;

          return Expanded(
            child: InkWell(
              onTap: () => onTap(index),
              borderRadius: BorderRadius.circular(18),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      color: selected
                          ? const Color(0xFF2563FF)
                          : const Color(0xFF9CA3AF),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: selected
                            ? const Color(0xFF2563FF)
                            : const Color(0xFF9CA3AF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class QuickActionData {
  const QuickActionData({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.iconColor,
  });

  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color iconColor;
}

class TransactionData {
  const TransactionData({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.color,
    required this.isPositive,
  });

  final String title;
  final String subtitle;
  final String amount;
  final Color color;
  final bool isPositive;
}

class BottomNavItem {
  const BottomNavItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
}

const _softShadow = BoxShadow(
  color: Color(0x140F172A),
  blurRadius: 24,
  offset: Offset(0, 14),
);